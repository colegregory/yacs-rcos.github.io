#!/bin/bash
# Script to publish a post into the _posts folder and take care of the annoying details,
# like entering the date and getting the filename right.

if [ -z $1 ]; then
  echo Usage: $0 post-source-file
  exit 1
fi
postsrc=$1
year="00"
month="00"
date="00"
hour="00"
minute="00"
second="00"

read_manual_date() {
  read -p "Enter year: " year
  read -p "Enter month as a 2-digit number: " month
  read -p "Enter date as a 2-digit number: " date
  read -p "Enter hour as a 2-digit number: " hour
  read -p "Enter minute as a 2-digit number: " minute
  read -p "Enter second as a 2-digit number: " second
}

good_date() {
  echo "Your date is $1"
  read -p "Is this correct? [Yn] " yn
  case $yn in
    [Nn]* ) return 1
  esac
  return 0
}

# get title from the post title
title=$(grep -m 1 '^title' $postsrc | sed -e 's/^title: *//' -e 's/"//g')
echo The title is:
echo $title
read -p "Is this correct? [Yn] " yn
case $yn in
  [Nn]* ) echo "Fix the title and start over."; exit 1;;
esac

# same for the author, although this doesn't get used
echo The author is:
echo $(grep -m 1 '^author' $postsrc | sed -e 's/^author: *//' -e 's/"//g')
read -p "Is this correct? [Yn] " yn
case $yn in
  [Nn]* ) echo "Fix the author and start over."; exit 1;;
esac

read -p "Set a publish date of right now? [Yn] " yn
case $yn in
  [Nn]* )
    echo "Entering the publish date manually."
    while [ 1 ]; do
      read_manual_date
      timestamp="$year-$month-$date $hour:$minute:$second"
      if good_date "$timestamp"; then
        break
      fi
    done;;
  [Yy]*|* ) timestamp=$(date +"%Y-%m-%d %H:%M:%S");;
esac

dateonly=$(echo $timestamp | sed 's/ .*$//g')
convtitle=$(echo $title | awk '{print tolower($0)}' | sed 's/ /-/g')
destfile="_posts/$dateonly-$convtitle.md"

cp -i $postsrc $destfile
echo "Successfully copied into _posts."

read -p "Remove your original file? [yN] " yn
case $yn in
  [Yy]* ) rm $postsrc
esac

sed -i "s/^date: .*$/date: $timestamp/" $destfile

# echo $timestamp
