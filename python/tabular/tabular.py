from enum import Enum


class Format(Enum):
    CSV = ','
    TAB = '\t'


def convert_to_table(string, _format):
    rows = string.split('\n')
    rows = ['| '+line.replace(_format.value, ' | ')+' |' for line in rows]

    table_matrix = [row.split(_format.value) for row in string.split('\n')]

    header_row = rows[0]
    header_top_border = len(header_row) * '_'
    bottom_border = len(header_row) * '='

    rows = [header_top_border] + [header_row] + [bottom_border] + rows[1:] + [bottom_border]
    return '\n'.join(rows)
