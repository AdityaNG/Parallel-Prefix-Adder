# 8 Bit Parallel Prefix Adder

- Authors: [Aditya NG](http://github.com/AdityaNG)

# Output

<img src="http://github.com/AdityaNG/Parallel-Prefix-Adder/blob/master/img/output.png?raw=true" width="600">

Performing Operation o = i0 + i1

## Working

Define the operation

<img src="https://github.com/AdityaNG/Parallel-Prefix-Adder/blob/master/img/operation.png?raw=true" width="400">

Consider the above operation implemented as the following module

<img src="http://github.com/AdityaNG/Parallel-Prefix-Adder/blob/master/img/module.png?raw=true" width="400">

For an 8 Bit Parallel Prefix Adder, consider 12 such modules such that :
1. 4 Modules L1a, L1b, L1c, L1d on layer 1 acting on the pairs (0,1), (2,3), (4,5), (6,7)
2. 4 Modules L2a, L2b, L2c, L2d on layer 2 acting on the pairs (L1a,2), (L1a,L1b), (L1c,6), (L1c,L1d)
3. 4 Modules L3a, L3b, L3c, L3d on layer 3 acting on the pairs (L2b,4), (L2b,L1c), (L2b,L2c), (L2b,L2d)
4. Outputs of all lines are xor-ed with the two corresponding input bits

Wiring diagram shown below

<img src="http://github.com/AdityaNG/Parallel-Prefix-Adder/blob/master/img/prefixAdder.png?raw=true" width="400">


# Performance

| Type			| Area			| Time |
| ------------- 	| ------------- 	| ------------- |
| Ripple Carry Adder	| 2(n-1)a		| (n-1)t	|
| Parallel Prefix Adder	| (n/2 log(n) + n-1)a	| (log(n) + 1)t	|

1. log to the base 2
2. a is area of one gate*
3. t is time of one gate*

* All gates assumed to have identical areas and path delays

## Running

Clone the repository:

```bash
$ git clone https://github.com/AdityaNG/Parallel-Prefix-Adder.git
```

Run the testbench:

```bash
$ iverilog helperModules.v testBench.v prefixAdder.v  
$ vvp a.out
$ gtkwave prefixAdder.vcd
```

## License

This software is released under the [GNU GPL v3 license](LICENSE).
