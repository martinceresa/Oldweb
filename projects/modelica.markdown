---
title: Modelica
date: 2016-01-01
---
#### Modelica Modular Compiler

[Modelica Language](https://www.modelica.org/) is a non-proprietary,
object-oriented, equation based language to conveniently model complex physical
systems containing, e.g., mechanical, electrical, electronic, hydraulic,
thermal, control, electric power or process-oriented subcomponents.
Modelica is a growing language, presenting new language constructions every now
an then. A [fellow researcher](https://www.fceia.unr.edu.ar/~fbergero/) asked me
how to simplify the process of adding new features to the language. My answer
was obviously **yes** but you will have to learn a bit of Haskell.
The result was a modular compiler construction with a lot of type information
preserving. The main idea was build specific AST to each compiler stage based on
*blocks* and *traversable/foldable* functions.
Sadly **we did not finish** this project, and [the
code](https://bitbucket.org/fbergero/modelica-hc) was left to die.
The main ideas implemented for modular construction and consumption used here were:
+ Data Types a la Carte : for simple modular data construction.
+ High-Order Functors and High-Order Free Monad: bigger trees with holes :D!. 
Classic definitions with a bit more Type/Kind information.

```
data HFree :: ((u -> *) -> u -> *) -> (u -> *) -> u -> * where
     Return :: f a -> HFree h f a
     Op     :: h (HFree h f) a -> HFree h f a
```
Which enable us to given a *High Functor* consume such structure with a *catamorphism*.

As presented to me, there were three basic stages presenting each one a bit
different AST from one another. Following my implementation we were able to
explicitly say how to build such an AST and write simple functions from one
stage to another.
For example, Flat Expression Modelica Ast:
```
type FlatAstDom =
  ClassDefinition + DerivedExtendedClass + EnumShortClass + RegularClass (Ident, Ident)
  + Composition + Component TypePrefix + External (FlatRef := 'TSubscript) + Declaration + ElementMod + Modification
  + Assign (FlatRef := 'TSubscript) + CallOutput CallArguments (FlatRef := 'TSubscript) + Statement + CallEq CallArguments
  + ForEq + IfWhen + EString + CallExpression + NumExp + Reference (FlatRef := 'TSubscript) + ArrayCons CallArguments
  + Expression + Subscript + FunExp
```
