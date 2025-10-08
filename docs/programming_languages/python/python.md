# python

*   start http server: `python3 -m http.server`

*   install requirements.txt:
    `python3 -m pip install -r <path_to_requirements>`

* create `requirements.txt`: `pip freeze > requirements.txt`

*   uninstall packages: `pip uninstall -r requirements.txt -y`

*   iPython:

    -   turn on module autoreload:

            %load_ext autoreload
            %autoreload 2

*   read csv:

<!-- -->

    import csv

    with open('employee_birthday.txt') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        line_count = 0
        for row in csv_reader:
            if line_count == 0:
                print(f'Column names are {", ".join(row)}')
                line_count += 1
            else:
                print(f'\t{row[0]} works in the {row[1]} department, and was born in {row[2]}.')
                line_count += 1
        print(f'Processed {line_count} lines.')
        
* read file:
```
with open('readme.txt') as f:
    lines = f.readlines()
```

## json files

* read json file:
```
import json

with open('json_data.json') as json_file:
    data = json.load(json_file)
    print(data)
```

* write json file:
```
with open('json_data.json', 'w') as outfile:
    json.dump(json_string, outfile)
```
## Debug

### Basic navigation
| Command      | Aliases        | What it does                                                                        |
| ------------ | -------------- | ----------------------------------------------------------------------------------- |
| `h`          | `help`         | General help or `help <cmd>`.                                                       |
| `q`          | `quit`, `exit` | Quit debugger and program.                                                          |
| `c`          | `continue`     | Run until next breakpoint or program end.                                           |
| `n`          | `next`         | Step **over** the current line (stay in frame).                                     |
| `s`          | `step`         | Step **into** calls.                                                                |
| `r`          | `return`       | Run until current function returns.                                                 |
| `unt`        | `until`        | Continue to a later line in the current frame; `until <lineno>` to a specific line. |
| `j <lineno>` | `jump`         | Set next line to execute (no running of skipped code).                              |
| `run`        | `restart`      | Restart the program.                                                                |

### Breakpoint
| Command                              | What it does                                 |
| ------------------------------------ | -------------------------------------------- |
| `b`                                  | List breakpoints.                            |
| `b <lineno>`                         | Breakpoint at line in current file.          |
| `b <file>:<lineno>`                  | Breakpoint in another file.                  |
| `b <funcname>`                       | Breakpoint at function entry.                |
| `tbreak <...>`                       | Temporary breakpoint (auto-clears when hit). |
| `condition <bpnum> <expr>`           | Make breakpoint conditional.                 |
| `ignore <bpnum> <count>`             | Ignore breakpoint the next N times.          |
| `disable <bpnum>` / `enable <bpnum>` | Disable/enable a breakpoint.                 |
| `cl`                                 | Clear **all** breakpoints.                   |
| `cl <bpnum>`                         | Clear one breakpoint.                        |

### Inspection
| Command           | Alias   | Description                                 |
| ----------------- | ------- | ------------------------------------------- |
| `l`               | `list`  | Show source code around the current line.   |
| `l <start>,<end>` | —       | List source lines in a range.               |
| `w`               | `where` | Print stack trace (where you are).          |
| `u`               | `up`    | Move up one stack frame.                    |
| `d`               | `down`  | Move down one stack frame.                  |
| `p <expr>`        | `print` | Evaluate and print expression.              |
| `pp <expr>`       | —       | Pretty-print expression.                    |
| `a`               | `args`  | Show arguments of the current function.     |
| `retval`          | —       | Show the return value of the last function. |

