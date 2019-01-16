defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot


  test "provides the raport of the robot's position" do
  {:ok, robot} = ToyRobot.place(2, 3, :west)
    assert ToyRobot.report(robot) == {2, 3, :west}
  end

  test "rotates the robot to the right" do
    {:ok, robot} = ToyRobot.place(0, 0, :north)
    position = robot
            |> ToyRobot.right
            |> ToyRobot.report

    assert position == {0, 0, :east}

    position = robot
               |> ToyRobot.right
               |> ToyRobot.right
               |> ToyRobot.report

    assert position == {0, 0, :south}
  end

  test "rotates the robot to the left" do
    {:ok, robot} = ToyRobot.place(0, 0, :north)
    position = robot
               |> ToyRobot.left
               |> ToyRobot.report

    assert position == {0, 0, :west}

#    position = ToyRobot.place(0, 0, :north)
#               |> ToyRobot.left
#               |> ToyRobot.left
#               |> ToyRobot.report
#
#    assert position == {0, 0, :south}
  end

  test "rotating the robot 3 times to the right is the same as rotating it once to the left" do
    {:ok, robot} = ToyRobot.place(0, 0, :north)
    right_position = robot
                    |> ToyRobot.right
                    |> ToyRobot.right
                    |> ToyRobot.right
                    |> ToyRobot.report

    left_position = robot
                    |> ToyRobot.left
                    |> ToyRobot.report

    assert right_position == left_position
  end

  test "moving robot up if it is facing the north" do
    {:ok, robot} = ToyRobot.place(0, 0, :north)
    position = robot
                    |> ToyRobot.move
                    |> ToyRobot.report

    assert position == {0, 1, :north}
  end

  test "moving robot right if it is facing the north" do
    {:ok, robot} = ToyRobot.place(0, 0, :east)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {1, 0, :east}
  end

  test "moving robot down if it is facing the north" do
    {:ok, robot} = ToyRobot.place(3, 3, :south)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {3, 2, :south}
  end

  test "moving robot left if it is facing the north" do
    {:ok, robot} = ToyRobot.place(3, 3, :west)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {2, 3, :west}
  end

  test "prevent the robot from falling north" do
    {:ok, robot} = ToyRobot.place(4, 4, :north)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {4, 4, :north}
  end

  test "prevent the robot from falling east" do
    {:ok, robot} = ToyRobot.place(4, 4, :east)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {4, 4, :east}
  end

  test "prevent the robot from falling south" do
    {:ok, robot} = ToyRobot.place(0, 0, :south)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {0, 0, :south}
  end

  test "prevent the robot from falling west" do
    {:ok, robot} = ToyRobot.place(0, 0, :west)
    position = robot
               |> ToyRobot.move
               |> ToyRobot.report

    assert position == {0, 0, :west}
  end
end
