---
title: klytius
date: 2015-01-01
---

#### Klytius

The use of the basic parallel combinators in Haskell produces a certain effect in
runtime, which is the parallelization of our program. But that effect is not directly
observable, we can try to guess what happened using tools like
[ThreadScope](https://wiki.haskell.org/ThreadScope/), but we still cannot match the behaviour of our program
and its source code. In this work I designed an EDSL around the basic combinators to
produce a *parallel structure* of programs, a data type that
reassembles how the parallel combinators were used in the source code, so one can see
and analyze the inherent parallel behaviour of our programs. The aim of this
work was the development of a tool to make parallelism observable, so one
can use
this information to help undergraduate students get a better understanding,
or to study the parallelism of our programs.
<br></br>
[Klytius](https://en.wikipedia.org/wiki/Clytius) is a tool to expose dynamic behavior based on the basic Haskell
parallel primitives.
The idea behind Klytius is to show the inner dynamic structure of your programs,
based on *par* and *pseq*. Klytius is a deep EDSL, with the ability to show you
this dynamic structure of your programs in a graphical way.
The code is in this public repository [Klytius](https://bitbucket.org/plfun/klytius), and I am open to critics and suggestions!
This was the final project of my career where I write down all the theoretical
framework needed [here](/$tesinapdf$) (and [the source code](https://bitbucket.org/martinceresa/ejemplo-tesina)) but sadly
it is in spanish. 

#####  Examples

Lets see an example, suppose you want to add two Int expressions
and you want it to be made in
parallel. We can evaluate those two expressions in parallel and then make
the addition, with Klytius we could get a picture as shown below where the circle
represents the presence of *par* and the hexagon represents the presence of
*pseq*, while boxes represent values.
<br></br>
![Example](/$ex1$)
