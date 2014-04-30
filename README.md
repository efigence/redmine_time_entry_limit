# Redmine Time Entry limit plugin

Limit available time report hours amount for one day.

By default Redmine allows report maximum 1000 hours per one time report.
User can create unlimited amount reports for one day.
This plugin aims to fix that.

## Requirements

Developed & tested on Redmine 2.3.3.

## Getting the plugin

A copy can be downloaded from [GitHub]( https://github.com/efigence/redmine_time_entry_limit )

## Installation and Setup

1. In your redmine root directory, run the command: `git clone https://github.com/efigence/redmine_time_entry_limit plugins/redmine_time_entry_limit`
2. Restart web server

## Configuration

Visit Administration -> Plugins. Afterwards, click on `Configure` link next to the plugin name.

Default hours limit is set to 20h and default number of days back for which you can report time is 7.

# License

    Redmine Time Entry limit plugin
    Copyright (C) 2014  efigence S.A.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
