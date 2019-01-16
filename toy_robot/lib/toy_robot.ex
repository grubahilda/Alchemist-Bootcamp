defmodule ToyRobot do

  @table_top_x 4
  @table_top_y 4

  @doc """
  Places the Toy Robot on the table in the default position

  Examples:

      iex> ToyRobot.place
      {:ok, %ToyRobot.Position{x: 0, y: 0, facing: :north}}
  """
  def place() do
    {:ok,%ToyRobot.Position{}}
  end

  def place(x, y, _facing)
    when x < 0 or y < 0 or x > @table_top_x or y > @table_top_y
    do
      {:failure, "Invalid position"}
  end

  def place(_x, _y, facing)
    when facing not in [:north, :south, :east, :west]
    do
    {:failure, "Invalid facing"}

  end

  def place(x, y, facing) do
    {:ok, %ToyRobot.Position{x: x, y: y, facing: facing}}
  end

  @doc """
  Places the Toy Robot on the table in the specified position and
  prevents placing the Toy Robot with invalid facing or outside of the table

  Examples:

      iex> ToyRobot.place(1, 2, :south)
      {:ok, %ToyRobot.Position{x: 1, y: 2, facing: :south}}

      iex> ToyRobot.place(-1, -1, :north)
      {:failure, "Invalid position"}

      iex> ToyRobot.place(0, 0, :north_west)
      {:failure, "Invalid facing"}
  """
  def report(%ToyRobot.Position{x: x, y: y, facing: facing} = _robot) do
    {x, y, facing}
  end

  @directions_to_the_right %{north: :east, east: :south, south: :west, west: :north}
  def right(%ToyRobot.Position{facing: facing} = robot) do

    %ToyRobot.Position{robot | facing: @directions_to_the_right[facing]}
  end

  @directions_to_the_left Enum.map(@directions_to_the_right, fn {from, to} -> {to, from} end)
  def left(%ToyRobot.Position{facing: facing} = robot) do
    %ToyRobot.Position{robot | facing: @directions_to_the_left[facing]}
  end

  def move(%ToyRobot.Position{x: _, y: y, facing: :north} = robot) when y < @table_top_y do
    %ToyRobot.Position{robot | y: y+1}
  end

  def move(%ToyRobot.Position{x: x, y: _, facing: :east} = robot) when x < @table_top_x do
    %ToyRobot.Position{robot | x: x + 1}
  end

  def move(%ToyRobot.Position{x: _, y: y, facing: :south} = robot) when y > 0 do
    %ToyRobot.Position{robot | y: y - 1}
  end

  def move(%ToyRobot.Position{x: x, y: _, facing: :west} = robot) when x > 0 do
    %ToyRobot.Position{robot | x: x - 1}
  end

  def move(robot), do: robot

end
