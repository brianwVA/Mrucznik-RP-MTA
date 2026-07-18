import re

def parse_model_data(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()

    insert_simple = []
    insert_char = []

    for line in lines:
        # Skip comments or empty lines
        if line.strip().startswith("//") or not line.strip():
            continue
        vw = 0
        # Parse AddSimpleModel
        print(line)
        match_simple = re.match(r'AddSimpleModel\((.+?)\);', line)
        if match_simple:
            args = match_simple.group(1).split(',')
            if len(args) == 5:  # Ensure exactly 5 arguments
                vw, baseid, newid, dff, txt = [arg.strip().strip('"') for arg in args]
                description = re.search(r'//\s*(.*)', line)
                description = description.group(1).strip() if description else 'NULL'
                insert_simple.append((0, vw, baseid, newid, dff, txt, description))
            else:
                print(f"Skipping line due to incorrect format: {line.strip()}")

        # Parse AddCharModel
        match_char = re.match(r'AddCharModel\((.+?)\);', line)
        if match_char:
            args = match_char.group(1).split(',')
            if len(args) == 4:  # Ensure exactly 5 arguments
                baseid, newid, dff, txt = [arg.strip().strip('"') for arg in args]
                description = re.search(r'//\s*(.*)', line)
                description = description.group(1).strip() if description else 'NULL'
                insert_char.append((1, vw, baseid, newid, dff, txt, description))
            else:
                print(f"Skipping line due to incorrect format: {line.strip()}")

    return insert_simple, insert_char

def generate_sql(insert_simple, insert_char, table_name):
    sql_statements = []

    if insert_simple:
        values_simple = ',\n'.join([
            f"({type_}, {vw}, {baseid}, {newid}, '{dff}', '{txt}', '{description}')"
            for type_, vw, baseid, newid, dff, txt, description in insert_simple
        ])
        sql_statements.append(
            f"INSERT INTO {table_name} (type, vw, baseid, newid, dff, txt, description)\nVALUES\n{values_simple};"
        )

    if insert_char:
        values_char = ',\n'.join([
            f"({type_}, {vw}, {baseid}, {newid}, '{dff}', '{txt}', '{description}')"
            for type_, vw, baseid, newid, dff, txt, description in insert_char
        ])
        sql_statements.append(
            f"INSERT INTO {table_name} (type, vw, baseid, newid, dff, txt, description)\nVALUES\n{values_char};"
        )

    return '\n\n'.join(sql_statements)

def main():
    input_file = 'artconfig.txt'  # Change this to the path of your input file
    table_name = 'models'  # Replace with your table name

    try:
        # Parse the data
        insert_simple, insert_char = parse_model_data(input_file)

        # Generate SQL statements
        sql_script = generate_sql(insert_simple, insert_char, table_name)

        # Save to a file
        output_file = 'insert_models.sql'
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write(sql_script)

        print(f"SQL script has been generated and saved to '{output_file}'.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == '__main__':
    main()