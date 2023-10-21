function braille = string2braille(inputString, BRAILLE_ALPHABET)
    % Convert (encode) a string into the Braille alphabet.

    % Initialize an empty string to store the encoded Braille
    braille = '';

    % Replace multiple spaces in the input string with a single space
    inputString = regexprep(inputString, ' +', ' ');

    % Iterate through the characters in the input string
    for i = 1:length(inputString)
        % Get the current character from the input string
        char = inputString(i);

        % Look up the corresponding Braille code for the character in the provided map
        brailleChar = BRAILLE_ALPHABET(char);

        % Check if a Braille code exists for the character
        if isempty(brailleChar)
            % If not, append the original character to the Braille string
            braille = [braille, char];
        else
            % If a Braille code exists, append it to the Braille string
            braille = [braille, brailleChar];
        end
    end

    % Trim any leading or trailing spaces in the encoded Braille
    braille = strtrim(braille);
end
