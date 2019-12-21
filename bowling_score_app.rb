module Bowler

    class ScoreCalculator
      def initialize(scores)
        @scores = scores.is_a?(String) ? scores.split(',') : scores
        @scores = @scores.map(&:to_i)
      end
  
      def calculate
        @current_frame = 0
        _calculate_from_frame(0)
      end
  
      def _calculate_from_frame(index)
        @current_frame += 1
        return 0 if _out_of_range?(index)
        return _rewarded_frame(index) unless _without_bonus?(index)
        _unrewarded_frame(index)
      end
  
      def _is_strike?(index)
        @scores[index] == Bowler::NUMBER_OF_PINS
      end
  
      def _without_bonus?(index)
        current_score = @scores[index] || 0
        next_score = @scores[index + 1] || 0
        (current_score + next_score) < Bowler::NUMBER_OF_PINS
      end
  
      def _out_of_range?(index)
        return true unless @scores[index]
        @current_frame > Bowler::NUMBER_OF_FRAME
      end
  
      def _rewarded_frame(index)
        index_increment_for_next = _is_strike?(index) ? 1 : 2
        rewarded_score = _rewarded_score(index)
        index_for_next = index + index_increment_for_next
        rewarded_score + _calculate_from_frame(index_for_next)
      end
  
      def _unrewarded_frame(index)
        _score_from_frame(index) + _calculate_from_frame(index + 2)
      end
  
      def _rewarded_score(index)
        end_index = (index + 2)
        scores = @scores[index..end_index] || []
        scores.reduce(:+) || 0
      end
  
      def _score_from_frame(index)
        end_index = (index + 1)
        scores = @scores[index..end_index] || []
        scores.reduce(:+) || 0
      end
    end

    NUMBER_OF_PINS = 10
    NUMBER_OF_STRIKE_REWARD = 2
    NUMBER_OF_SPARE_REWARD = 1
    NUMBER_OF_FRAME = 10
    
  end

