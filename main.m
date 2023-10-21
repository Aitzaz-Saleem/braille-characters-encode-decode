% Load an image from file and convert it to grayscale
a = imread('image.jpg'); % Read the image
I = rgb2gray(a); % Convert the image to grayscale

% Apply thresholding to create a binary image
threshold = 127; % Define a threshold value
binary_image = I >= threshold; % Create a binary image based on the threshold

% Perform 8-connected component analysis to label regions
[label_matrix, num_regions] = bwlabel(binary_image, 8); % Label connected components
region_properties = regionprops(label_matrix, 'Area'); % Extract region properties

% Create a 3x2 matrix with zeros
matrix_3x2 = zeros(3, 2); % Initialize a 3x2 matrix

% Print the area of each labeled region and update the matrix
disp('Area of each region:');
for i = 1:num_regions
    disp(['Region ', num2str(i), ': ', num2str(region_properties(i).Area)]);
    if region_properties(i).Area > 5000 % Check if the region area is greater than 5000
        [row, col] = ind2sub(size(matrix_3x2), i); % Convert region label to row and column
        matrix_3x2(row, col) = 1; % Update the matrix with 1
    end
end

% Display the thresholded image
figure;
subplot(1, 2, 1);
imshow(binary_image); % Display the binary image
title('Thresholded Image');

% Display the labeled regions
subplot(1, 2, 2);
imshow(label2rgb(label_matrix, 'jet', 'k', 'shuffle')); % Display labeled regions
title('Labeled Regions');

% Print the 3x2 matrix
disp('3x2 Matrix:');
disp(matrix_3x2); % Print the matrix

% Convert the matrix into a single string
binary_code = num2str(matrix_3x2(:)'); % Convert matrix to a string

% Remove spaces and commas to get a single string of numbers
binary_code = strrep(binary_code, ' ', '');  % Remove spaces
binary_code = strrep(binary_code, ',', '');  % Remove commas

% Define the Braille alphabet binary code as a map
BRAILLE_CHARACTERS = containers.Map({
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
}, {
    '100000', '101000', '110000', '110100', '100100', '111000', '111100', '101100', '011000', '011100', '100010', '101010', '110010', '110110', '100110', '111010', '111110', '101110', '011010', '011110', '100011', '101011', '110011', '110111', '100111', '111011', '011011', '011111', '001100', '001101', '001110', '001111', '001010', '001011', '001000', '001001'
});

% Call the function to get the corresponding Braille character
brailleCharacter = binaryToBraille(binary_code, BRAILLE_CHARACTERS);
disp('Decoded Braille Alphabet')
disp(brailleCharacter)
