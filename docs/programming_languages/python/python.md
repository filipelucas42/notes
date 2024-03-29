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
