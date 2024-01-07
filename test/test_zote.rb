# frozen_string_literal: true

require "test_helper"

class TestZote < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Zote::VERSION
  end

  def with_controlled_randomness
    old_seed = Kernel.srand(0)
    begin
      yield
    ensure
      Kernel.srand(old_seed)
    end
  end

  def test_returns_random_precept_with_no_number
    with_controlled_randomness do
      precept = Zote.get
      assert_equal(precept, "Precept Forty-Five: 'One Thing Is Not Another'. This one should be obvious, but I've had others try to argue that one thing, which is clearly what it is and not something else, is actually some other thing, which it isn't. Stay on your guard!")
    end
  end

  def test_returns_random_precept_with_nil
    with_controlled_randomness do
      precept = Zote.get(nil)
      assert_equal(precept, "Precept Forty-Five: 'One Thing Is Not Another'. This one should be obvious, but I've had others try to argue that one thing, which is clearly what it is and not something else, is actually some other thing, which it isn't. Stay on your guard!")
    end
  end

  def test_returns_random_precept_with_bad_input
    with_controlled_randomness do
      precept = Zote.get("a")
      assert_equal(precept, "Precept Forty-Five: 'One Thing Is Not Another'. This one should be obvious, but I've had others try to argue that one thing, which is clearly what it is and not something else, is actually some other thing, which it isn't. Stay on your guard!")
    end
  end

  def test_returns_exact_precept_with_number
    precept = Zote.get(1)
    assert_equal(precept, "Precept One: 'Always Win Your Battles'. Losing a battle earns you nothing and teaches you nothing. Win your battles, or don't engage in them at all!")
  end
end
