%   19129576
%   mlp ccw
%   comp6011


% Note: this file merely specifies the MLP class. It is not meant to be
% executed as a stand-alone script. The MLP needs to be instantiated and
% then used elsewhere, see e.g. 'testMLP131train.m'.

% A Multi-layer perceptron class
classdef MLP < handle
    % Member data
    properties (SetAccess=private)
        inputDimension % Number of inputs
        hiddenDimension % Number of hidden neurons
        outputDimension % Number of outputs
        
        hiddenLayerWeights % Weight matrix for the hidden layer, format (hiddenDim)x(inputDim+1) to include bias terms
        outputLayerWeights % Weight matrix for the output layer, format (outputDim)x(hiddenDim+1) to include bias terms

    end
    
    methods
        % Constructor: Initialize to given dimensions and set all weights
        % zero.
        % inputD ~ dimensionality of input vectors
        % hiddenD ~ number of neurons (dimensionality) in the hidden layer 
        % outputD ~ number of neurons (dimensionality) in the output layer 
        function mlp=MLP(inputD,hiddenD,outputD)
            mlp.inputDimension=inputD;
            mlp.hiddenDimension=hiddenD;
            mlp.outputDimension=outputD;
            mlp.hiddenLayerWeights=zeros(hiddenD,inputD+1);
            mlp.outputLayerWeights=zeros(outputD,hiddenD+1);
            
          
            
        end
        
        % TODO Implement a randomized initialization of the weight
        % matrices.
        % Use the 'stdDev' parameter to control the spread of initial
        % values.
        function mlp=initializeWeightsRandomly(mlp,stdDev)
            % Note: 'mlp' here takes the role of 'this' (Java/C++) or
            % 'self' (Python), refering to the object instance this member
            % function is run on.
            mlp.hiddenLayerWeights=zeros(mlp.hiddenDimension,mlp.inputDimension+1);% TODO
            mlp.outputLayerWeights=zeros(mlp.outputDimension,mlp.hiddenDimension+1);% TODO
            
            
            mlp.hiddenLayerWeights = mlp.hiddenDimension./size( mlp.hiddenLayerWeights, 2);
            mlp.outputLayerWeights = mlp.outputDimension./size( mlp.outputLayerWeights, 2);

            
        end
        
        % TODO Implement the forward-propagation of values algorithm in
        % this method.
        % 
        % inputData ~ a vector of data representing a single input to the
        % network in column format. It's dimension must fit the input
        % dimension specified in the contructor.
        % 
        % hidden ~ output of the hidden-layer neurons
        % output ~ output of the output-layer neurons
        % 
        % Note: the return value is automatically fit into a array
        % containing the above two elements
        function [hidden,output]=compute_forward_activation(mlp, inputData)
            
            
            trainingSetSize = size(inputData, 2);
            
            % Choose activation function.
            activationFunction = @logisticSigmoid;
            dActivationFunction = @dLogisticSigmoid;

            
            %hidden = zeros(mlp.hiddenDimension);% TODO
            %output = zeros(mlp.outputDimension);% TODO
            k =1;
            hidden(k) = floor(rand(1)*trainingSetSize + 1);
            hiddenVector = inputData(:, hidden(1));
            
            mlp.hiddenDimension = mlp.hiddenLayerWeights * hiddenVector;
            hiddenOutputVector = activationFunction(mlp.hiddenDimension);
            
           
            mlp.outputDimension = mlp.outputLayerWeights * hiddenOutputVector;
            output = activationFunction(mlp.outputDimension);
           
      
            
            
            
            
        end
        
        
        % This function calls the forward propagation and extracts only the
        % overall output. It does not have to be altered.
        function output=compute_output(mlp,input)
            [~,output] = mlp.compute_forward_activation(input);
        end
        
        
        % TODO Implement the backward-propagation of errors (learning) algorithm in
        % this method.
        %
        % This method implements MLP learning by means on backpropagation
        % of errors on a single data point.
        %
        % inputData ~  a vector of data representing a single input to the
        %   network in column format.
        % targetOutputData ~ a vector of data representing the
        %   desired/correct output the network should generate for the given
        %   input (this is the supervision signal for learning)
        % learningRate ~ step width for gradient descent
        %
        % This method is expected to update mlp.hiddenLayerWeights and
        % mlp.outputLayerWeights.
        function mlp=train_single_data(mlp, inputData, targetOutputData, learningRate)
            
            
            [h,o] = mlp.compute_forward_activation(inputData);
            
           
            % TODO 

            
            %h = mlp.hiddenDimension;
            %o = mlp.outputDimension;
            
            
            
            
        end
    end
end
