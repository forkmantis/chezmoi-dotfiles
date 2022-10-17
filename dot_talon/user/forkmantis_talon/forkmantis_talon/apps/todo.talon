to do do <number>:
    insert("t do {number}; tls")

to do add <user.letter>:
    insert("t  add \"({letter}) \"")
    key(left)

to do priority <number> <user.letter>: "t pri {number} {letter}"

to do remove <number>:
    insert("t rm {number}; tls")

to do append <number>:
    insert("t append {number} ")

to do increment <number>:
    insert("t append {number} .; tls")
    key(enter)

to do list [<user.text>]: "tls {text or ''}\n"

to do {user.contexts}:
    insert("tls @{user.contexts}")
    key(enter)

to do archive:
    insert("t archive; tls")
    key(enter)

to do report:
    insert("t report")
    key(enter)

to do sink:
    insert("t sync")
    key(enter)

to do transfer:
    insert("txfer")
    key(enter)
