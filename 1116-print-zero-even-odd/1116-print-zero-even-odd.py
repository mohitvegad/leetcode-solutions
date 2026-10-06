from threading import Condition

class ZeroEvenOdd:
    def __init__(self, n: int):
        self.n = n
        self.condition = Condition()
        self.turn = 0

    def zero(self, printNumber: 'Callable[[int], None]') -> None:
        for i in range(1, self.n + 1):
            with self.condition:
                while self.turn != 0:
                    self.condition.wait()

                printNumber(0)

                if i % 2 == 1:
                    self.turn = 1
                else:
                    self.turn = 2

                self.condition.notify_all()

    def even(self, printNumber: 'Callable[[int], None]') -> None:
        for i in range(2, self.n + 1, 2):
            with self.condition:
                while self.turn != 2:
                    self.condition.wait()

                printNumber(i)

                self.turn = 0
                self.condition.notify_all()

    def odd(self, printNumber: 'Callable[[int], None]') -> None:
        for i in range(1, self.n + 1, 2):
            with self.condition:
                while self.turn != 1:
                    self.condition.wait()

                printNumber(i)

                self.turn = 0
                self.condition.notify_all()