configurable string name = "default user";

# Returns the string `Hello` with the input string name.
#
# + return - "Hello, " with the input string name
public function hello() returns string {
    if !(name is "") {
        return "Hello, " + name;
    }
    return "Hello, World!";
}
