abstract class CounterState {}
class Intialsata extends CounterState
{

}
class  CounterPlusState extends CounterState
{
  final int counter;

  CounterPlusState(this.counter);

}
class CounterMinusState extends CounterState
{
  final int counter;

  CounterMinusState(this.counter);
}