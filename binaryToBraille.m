function brailleCharacter = binaryToBraille(binaryCode, BRAILLE_CHARACTERS)
    % Convert a binary code to a Braille character using the provided map.
    brailleCharacter = '';

    % Extract the keys (Braille characters) from the provided map
    brailleKeys = keys(BRAILLE_CHARACTERS);

    % Iterate through the Braille character keys in the map
    for i = 1:length(brailleKeys)
        brailleKey = brailleKeys{i};

        % Check if the current Braille character's binary code matches the input code
        if strcmp(binaryCode, BRAILLE_CHARACTERS(brailleKey))
            % If a match is found, assign the Braille character to the output
            brailleCharacter = brailleKey;
            break;  % Exit the loop when a match is found
        end
    end
end
