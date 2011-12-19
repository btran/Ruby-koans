require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  # TODO: need to create a scoring function that dispatches on the argument
  sum=0
  ones=[]
  twos=[]
  threes=[]
  fours=[]
  fives=[]
  sixes=[]

  def sizeIs3?(y,sum)
    begin
      if y == 1
        begin
          sum = sum + 1000 - 200
          ones = []
          sum
        end
      elsif y== 5
        begin
          sum += (y*100) - 100
          fives = []
          sum
        end
      else
        begin
          sum += (y*100)
          if y == 2
            twos = []
          elsif y== 3
            threes = []
          elsif y== 4
            fours = []
          elsif y== 6
            sixes = []
          end
          sum
        end
      end
    end
  end
  if dice == []
    return sum
  end
  dice.each {|x|
    if x == 1
      begin
        ones.push(x)
        if ones.size == 3
          begin
            sum = sizeIs3?(x,sum)
          end
        else
          sum += 100
        end
      end
    elsif x == 5
      begin
        fives.push(x)
        if fives.size == 3
          begin
            sum = sizeIs3?(x,sum)
          end
        else
        sum += 50
      end
      end
    elsif x == nil
      begin
        return sum
      end
    else
      begin
        if x == 2
          begin
            twos.push(x)
            if twos.size == 3
              begin
                sum = sizeIs3?(x,sum)
              end
            end
          end
        elsif x == 3
          begin
            threes.push(x)
            if threes.size == 3
              begin
                sum = sizeIs3?(x,sum)
              end
            end
          end
        elsif x == 4
          begin
            fours.push(x)
            if fours.size == 3
              begin
                sum = sizeIs3?(x,sum)
              end
            end
          end
        elsif x == 6
          begin
            sixes.push(x)
            if sixes.size == 3
              begin
                sum = sizeIs3?(x,sum)
              end
            end
          end
        end
      end
    end
  }
  sum
  # You need to write this method
end

class AboutScoringProject < EdgeCase::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
  end

end
