import bal_data.configurable_module;
import bal_data.util;
import ballerina/io;

public function main() {
    io:println("Hello, World!");
    string name = configurable_module:hello();
    io:println(name);
    util:demoType();
}
