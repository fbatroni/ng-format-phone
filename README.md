Angular Phone Format
===========

Convert to phone number format. Data-binding and internationalization supported.

## Examples:


| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |



#### Display a phone number:

```
<span phone-number="8886563726"></span>
```

displays '+1-888-656-3726'

--

#### Display an international phone number:

```
<span phone-number="443455559870"></span>
```

displays '+44-345-555-9870'

--

#### Display an phone number with an extension:

```
<span phone-number="8886563726" "250"></span>
```

displays '+1-888-656-3726 x250'

--

####  Data-Binding

```
<span phone-number="{{ vm.phoneNumber }}"></span>
