// Author: https://github.com/KeeVeeGames/Exception.gml/tree/master
// License: MIT

global.__yygmlexception_static = undefined;

// Catch a system runtime exception to get its static struct
//try {
//    throw "test";
//} catch (exception) {
//    global.__yygmlexception_static = static_get(exception);
//}

function Exception() constructor {
	//static_set(self, global.__yygmlexception_static); // Inherit from system YYGMLException
    
    message = "";
    long_message = "";
    script = "";
    line = -1;
    stacktrace = []; /// @is {String[]}
    
    // TODO: Check callstack format on different target platfroms
    // TODO: Replace string functions with buffer mutations?
    var stack = debug_get_callstack();
    
    for (var i = 2, length = array_length(stack) - 1; i < length; i++) {
        var stackline = stack[i];
        var colon_position = string_pos(":", stackline);
        
        if (i == 2) {
            script = string_copy(stackline, 1, colon_position - 1);
            line = real(string_copy(stackline, colon_position + 1, string_length(stackline) - colon_position));
        }
        
        stackline = string_replace(stackline, ":", " (line ");
        stackline += ")";
        
        array_push(stacktrace, stackline);
    }
    
    static toString = function() {
        return long_message;
    }
    
    static init = function() {
        var exception_name = instanceof(self);
        message = string("{0}: {1}", exception_name, message);
        long_message = string("{0}\r\n{1}", exception_name, long_message);
        
        // Add more info for YYC as it is not adding standard error output like on VM
        if (code_is_compiled()) {
            long_message = string("Unable to find a handler for exception {0}\r\n", long_message);
            
            for (var i = 0, length = array_length(stacktrace); i < length; i++) {
                long_message += "\r\n" + stacktrace[i];
            }
        }
        
        // Fixes for weird constructor inheritance GM bug and YYC shenanigans
        static_set(self, static_get(Exception));
    }
}

/// @param {Strcut} reference
/// @param {Strcut} target
function StructIndentityException(reference, target) : Exception() constructor {
	message = "The resulting structure does not match the expected format";
	long_message = $"{message},\r\nreference: {reference},\r\ntarget: {target}";
	init();
}

/// @param {Struct} exception
function EventException(exception) : Exception() constructor {
	self.message = $"Listener method thrown unhandled exception: \n\r{exception.longMessage}\n\r{exception.script}\n\r{string_join(exception.stacktrace, "\n\r")}";
	init();
}
