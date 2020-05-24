%
% Matlab code for the Course:
%
%     Modelling and Simulation of Mechatronics System
%
% by
% Enrico Bertolazzi
% Dipartimento di Ingegneria Industriale
% Universita` degli Studi di Trento
% email: enrico.bertolazzi@unitn.it
%
classdef RK4_P < ODEbaseSolverRKexplicit_P
  methods
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    %  Classic fourth-order method
    %
    % 0   | 0   0   0   0
    % 1/2 | 1/2 0   0   0
    % 1/2 | 0   1/2 0   0
    % 1   | 0   0   1   0
    % ----+----------------
    %     | 1/6 1/3 1/3 1/6
    %
    function self = RK4_P( )
      self@ODEbaseSolverRKexplicit_P('RK4_P',...
         [  0,  0, 0, 0;...
          1/2,  0, 0, 0;...
            0,1/2, 0, 0;...
            0,  0, 1, 0 ],...
         [1/6,1/3,1/3,1/6],[0,1/2,1/2,1]...
      );
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function delete( self )
    end
  end
end