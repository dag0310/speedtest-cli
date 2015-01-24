# speedtest-cli (+ run-and-log.sh)
This fork includes an additional shell script which allows you to save the output of a speedtest to a CSV log file. The same license applies.

Best used in combination with [**Speedtests**](https://github.com/dag0310/speedtests)!

The original README can be found [here](README.rst).

## Prerequisites
- Linux
- Python 2.4 - 3.4

## Usage
Execute this command to run a speedtest and add a log entry to the specified file. Make sure you have execution rights on the script.

`./run-and-log.sh <filepath_of_log_file>`

Example: `./run-and-log.sh /volume1/web/speedtests/log.csv`

### Add as cron job (run every day automatically)
Add a cron job in your "/etc/crontab" file by adding a line like this:

Example: `0 5 * * * root /volume1/private/speedtest-cli/run-and-log.sh /volume1/web/speedtests/log.csv`

This will run a speedtest every day at 5 AM and save it to a log file.
For further reference please [consult Wikipedia](http://en.wikipedia.org/wiki/Cron)

Note: Be sure to use TABS instead of SPACES on Synology NAS and maybe also other platforms.