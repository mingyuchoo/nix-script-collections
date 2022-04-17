# nix-script-collections

## Prerequisite

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Nix REPL

```nix
nix repl '<nixpkgs>'
```

## Nix Language

### Values

#### Simple Values

* Strings
* Numbers
  * integers
  * floating point
  * Paths
  * Booleans
  * The null value

### Lists

```nix
[ v1 v2 v3 ... vn ]

```

```nix
# example
[ 123 ./foo.nix "abc" (f { x = y; }) ]
```

### Sets

```nix
{ name1 = value1;
  name2 = value2;
  ...
}
```

```nix
# example
{ x = 123;
  text = "Hello";
  y = f { bla = 456; };
}

```

### Recursive sets

```nix
# example
rec {
  x = y;
  y = 123;
}.x
```

### Let-expressions

```nix
let e1; in e2
```

```nix
# example
let x = "foo";
    y = "bar";
in x + y
```

### Inheriting attributes

```nix
# example
let x = 123 in
{ inherit x;
  y = 456;
}

# is equivalent to
let x = 123; in
{ x = x;
  y = 456;
}
```

### Functions

```nix
pattern: body
```

### Conditionals

```nix
if e1 then e2 else e3
```

### Assertions

```nix
assert e1; e2
```

### With-expressions

```nix
with e1; e2
```

### Comments

```nix
#
/* ... */
```
