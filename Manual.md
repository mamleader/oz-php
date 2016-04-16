

# Introduction #

oz.php represents a very tiny but powerful PHP framework for creating small-to-medium web applications.

## What oz-php offers ##

  * Object-oriented approach
  * Simple but flexible regex-based routing
  * Templating support (XSLT recommended, but not required)
  * Basic typographical replacements
  * Safe access to request data

## What oz-php does not provide ##

  * ORM
  * Automagickz of any kind

## Localization ##

Supported by using the `_.xsl` template.

## List of classes and its methods ##

### DB ###
  * `DB::__construct($dsn, $user, $pass, $driver_options)`
  * `DB::query($query, $param, ...)` - pass arguments as an array or as a variable-length list of arguments
  * `DB::insert($table, $values)`
  * `DB::update($table, $id, $values)`
  * `DB::delete($table, $id = null)`

### XML ###
  * `XML::setTemplate("/path/to/file.xsl")`
  * `XML::setParameter($name, $value)`
  * `XML::addData($name, $array)` - array is recursively transformed to XML
  * `XML::addFilter($filter)` - $filter instanceof FILTER
  * `XML::toString()` - apply XSL transformation

### APP ###
  * `APP::dispatch()` - respond to HTTP request
  * `APP::error{404, 405, 500, 501}()`

### HTTP ###
  * `HTTP::$BASE` - (autodetected) application root
  * `HTTP::value($name, $where, $default)` - $where = "get", "post", "cookie"; coerced to datatype of $default
  * `HTTP::status($code)`
  * `HTTP::redirect($where)` - automatically prefixed by $BASE
  * `HTTP::redirectBack()` - redirect to HTTP\_REFERER

### FILTER ###
  * `FILTER::apply($input)`

### FILTER\_TYPO ###
  * Typographic replacements

### FILTER\_NBSP ###
  * Replace certain spaces with HTML nbsp entities

### FILTER\_FRACTIONS ###
  * Replace fractions with unicode characters