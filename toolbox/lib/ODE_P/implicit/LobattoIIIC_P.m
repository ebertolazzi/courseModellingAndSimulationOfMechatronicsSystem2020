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
classdef LobattoIIIC_P < ODEbaseSolverRKimplicit_P
  methods
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    % Lobatto IIIC
    %
    % 0   | 1/6   1/3   -1/6
    % 1/2 | 1/6  5/12  -1/12
    % 1   | 1/6   2/3    1/6
    % ----+-----------------
    %     | 1/6   2/3    1/6
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function self = LobattoIIIC_P()
      self@ODEbaseSolverRKimplicit_P('LobattoIIIC_P',...
        [1/6,1/3,-1/6;1/6,5/12,-1/12;1/6,2/3,1/6],...
        [1/6,2/3,1/6],[0;1/2;1]...
      );
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function delete( self )
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  end
end