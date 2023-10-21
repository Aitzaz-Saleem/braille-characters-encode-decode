# braille-characters-encode-decode

Description of " Main.m ":
In this file, code reads an image, converts it to grayscale, and performs thresholding to create a binary image. The code then performs 8-connected component analysis to identify the regions in the binary image. The area of each region is calculated and printed to the console. If a region's area is greater than 5000, a 1 is assigned to a corresponding element in a 3x2 matrix. The thresholded image and the labeled regions are then displayed. The 3x2 matrix is converted into a single string of numbers, which is then used to look up the corresponding Braille character in a map. The Braille character is then printed to the console.

Description of " Testing.m ":
In this file, code defines a map of Braille alphabet binary codes. The string2braille() function uses this map to encode a given string into Braille code. The braille2string() function uses the same map to decode Braille code into a string. The code is tested by encoding the string "imageprocessing" into Braille code and then decoding the Braille code back into a string.

Description of " stringTobraille.m " Function:
This code defines a function called stringTobraille() that converts a string into Braille code. The function takes two inputs: the string to be converted and a map of Braille alphabet binary codes. The function iterates through the characters in the input string and looks up the corresponding Braille code for each character in the provided map. If a Braille code exists for the character, it is appended to the Braille string. If a Braille code does not exist for the character, the original character is appended to the Braille string. The function then trims any leading or trailing spaces in the encoded Braille and returns the result.

Description of " brailleTostring.m " Function:
This code defines a function called brailleTostring() that converts Braille code into a string. The function takes two inputs: the Braille code to be converted and a map of Braille alphabet binary codes. The function creates a reverse mapping from Braille characters to their values. The function then iterates through the input Braille code and attempts to match it to the available Braille characters. If a match is found, the corresponding character is appended to the output string. If no match is found, the current Braille code character is appended to the output string. The function continues this process until all of the Braille code has been processed. The function then trims any leading or trailing spaces in the output and returns the result.


# Braille Alphabets Container Map
BRAILLE_ALPHABET = containers.Map({'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}, ...
    {'⠁', '⠃', '⠉', '⠙', '⠑', '⠋', '⠛', '⠓', '⠊', '⠚', '⠅', '⠇', '⠍', '⠝', '⠕', '⠏', '⠟', '⠗', '⠎', '⠞', '⠥', '⠧', '⠺', '⠭', '⠽', '⠵', '⠼⠁', '⠼⠃', '⠼⠉', '⠼⠙', '⠼⠑', '⠼⠋', '⠼⠛', '⠼⠓', '⠼⠊', '⠼⠚'});

    
