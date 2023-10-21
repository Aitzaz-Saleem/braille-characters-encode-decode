function outputString = brailleTostring(brailleCode, BRAILLE_ALPHABET)
    % Convert (decode) the Braille alphabet into a string.

    % Initialize an empty string to store the decoded output
    outputString = '';

    % Create a reverse mapping from Braille characters to their values
    braille = containers.Map(values(BRAILLE_ALPHABET), keys(BRAILLE_ALPHABET));

    % Extract the keys (Braille characters) from the reverse mapping
    brailleKeys = keys(braille);

    % Initialize an index for the input Braille code
    i = 1;

    % Loop to decode the Braille code
    while i <= length(brailleCode)
        found = false; % Initialize a flag to track character matching

        % Iterate through the available Braille characters
        for j = 1:length(brailleKeys)
            brailleChar = brailleKeys{j};

            % Check if the Braille code starts with the current Braille character
            if strncmp(brailleCode, brailleChar, length(brailleChar))
                % Append the corresponding character to the output string
                outputString = [outputString, braille(brailleChar)];
                
                % Remove the processed part of the Braille code
                brailleCode(1:length(brailleChar)) = '';

                found = true; % Set the flag to indicate a match
                break; % Exit the loop
            end
        end

        % If no match was found, append the current Braille code character
        if ~found
            outputString = [outputString, brailleCode(1)];
            brailleCode(1) = '';
        end
    end

    % Trim any leading or trailing spaces in the output
    outputString = strtrim(outputString);
end
