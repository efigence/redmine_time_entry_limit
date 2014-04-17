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

## License

Redmine Time Entry limit plugin is an Open Source project covered by the GNU General Public License version 2. See LICENSE file.
