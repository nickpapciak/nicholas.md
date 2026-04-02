// title: All of vector calculus and linear algebra
// date: 2025-05-11
// description: A reference sheet for Shifrin's Multivariable Mathematics

#import "../template.typ": *
#show: post

This is a big reference sheet/summary for Theodore Shifrin's Multivariable Mathematics textbook. Much of this was written while taking math 3510 as a freshman in college, which I still consider to be the hardest class I have ever taken. This is not meant to be used to learn from. Actually, this would be a terrible reference to learn from. Instead, it is meant to go over the major points and key ideas of the course, and some fun stuff, mostly as a reference to look back on when studying or after taking the course :)

This is currently unfinished and I go and add stuff to it every once in a while to make it more complete.

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 6: Solving Nonlinear Problems

== 6.1 The Contraction Mapping Principle

=== Convergence of Vector Sums

If you have a convergent sequence of vectors ${ bold(a)_k }$, then this convergent sequence of vectors will converge as long as the norms of the vectors converge

$ sum_(k=1)^infinity norm(bold(a)_k) "converges" ==> sum_(k=1)^infinity bold(a)_k "converges" $

=== Contraction Mappings

A contraction mapping is a function that always shrinks the distance between two points.

For $X subset RR^n, bold(f): X -> X$, $bold(f)$ is a contraction mapping if $exists c in (0, 1)$ such that

$ norm(bold(f)(bold(x)) - bold(f)(bold(y))) <= c norm(bold(x) - bold(y)) $

Contraction mappings are always continuous, and have at most one fixed point. If $X$ is closed, we can specify that such a point does exist. This is called the contraction mapping principle. The contraction mapping principle states that if you call a contraction mapping $bold(f)$ enough times, then it eventually converges on some point, called the fixed point of $bold(f)$.

if $X$ is closed, then $exists bold(x) in X$ so that $bold(f)(bold(x)) = bold(x)$

=== The Mean Value Inequality

The MVT in single-var calc tells us that, on a continuous curve, there is some point where the tangent line at that point has the same slope as the secant line between the two endpoints. i.e. that $frac(f(b) - f(a), b - a) = f'(x)$ for some $x in (a, b)$. If we rearrange, however, this result tells us how much a function stretches or shrinks two points based on the slope of the function. This idea is is how we generalize the MVT to $RR^n$

If $U subset RR^n$ is open, $bold(f): U -> RR^m$, and $bold(a), bold(b) in U$ with a $cal(C)^1$ path in U which joins them, then

$ norm(bold(f)(bold(b)) - bold(f)(bold(a))) <= lr((max_(bold(x) in [bold(a), bold(b)]) norm(D bold(f)(bold(x))))) norm(bold(b) - bold(a)). $

This gives us a really useful condition which we can use to prove that certain functions are contraction mappings.

(If $0 < max_(bold(x) in [bold(a), bold(b)]) norm(D bold(f)(bold(x))) < 1$).

=== Matrix Theorems

Generalization of a geometric series. If $A in cal(M)_(n times n)$ and $norm(A)_("op") < 1$, then $sum_(i=0)^infinity A^i = (I - A)^(-1)$

The general linear group $"GL"(n)$ of invertible matrices is an open subset of $cal(M)_(n times n)$, and $f: "GL"(n) -> "GL"(n)$ given by $f(A) = A^(-1)$ is smooth.

Since $cal(M)_(m times n)$ is isomorphic to $RR^(n m)$, we can take derivative maps of matrix-valued functions. For example, consider $f: cal(M)_(n times n) -> cal(M)_(n times n)$ given by $f(A) = A^2$. We can use the limit definition similarly to vectors (with respect to the frobenius norm) and show $[D f(A)] B = A B + B A$. What this says, is that if we associate a linear map to $[D f(A)]: RR^(n^2) -> RR^(n^2)$, then that linear map takes a $B in RR^(n^2)$ to $A B + B A$ (a sort of matrix power rule, which unfortunately doesn't simplify since multiplication is non-commutative).

The symmetric matrices where $A^T = A$ form an $1/2 n(n+1)$-dimensional subspace. The orthogonal group $"O"(n) subset cal(M)_(n times n)$ = {set of matrices where $A^T A = I$} is a $1/2 n(n-1)$-dimensional submanifold, and $T_I "O"(n)$ (tangent plane at the identity) is the set of skew-symmetric matrices $"Skew"(n)$ = {set of matrices where $A^T = -A$}

== 6.2 The Inverse and Implicit Function Theorems

=== Inverse Function Theorem

The Inv. FT is an incredibly powerful theorem which tells us under what conditions a certain function $bold(f)$ has a local inverse, and what the derivative of that inverse looks like. To have an inverse, the derivative map must be locally invertible, and the inverse of that derivative map is the derivative of the inverse.

More formally it says if $U subset RR^n$ is open, $bold(f): U -> RR^n$ is $cal(C)^1$, $bold(x)_0 in U$ and $D bold(f)(bold(x)_0)$ is invertible, then $exists$ two open neighborhoods, $V subset U$ of $bold(x)_0$ and $W$ of $bold(y)_0 := bold(f)(bold(x)_0)$, and a $cal(C)^1$ function between them $bold(g): V -> W$ so that

$ forall bold(x) in V, bold(g)(bold(f)(bold(x))) = bold(x) $

$ forall bold(y) in W, bold(f)(bold(g)(bold(y))) = bold(y) $

Furthermore,

$ D bold(g)(bold(f)(bold(x))) = (D bold(f)(bold(x)))^(-1) $

=== Implicit Function Theorem

The Imp. FT, a consequence of the Inv. FT, is another incredibly powerful result. It tells us that a series of $m$ implicit equations of $n$ variables can be written locally as $m$ explicit functions of $n - m$ variables (as long as the derivative map of the output variables is invertible). It is like a non-linear generalization of pivot and free variables. This is also incredibly useful for our future study of manifolds; it links the implicit description to the explicit description and allows us to think of manifolds locally as spaces where we can perform calculus like it's linear algebra.

More formally, for the Imp. FT we need $n > m$, and a $cal(C)^1$ function $bold(F): U subset RR^n -> RR^m$ where $U$ is open. Then, writing a vector $mat(delim: "[", bold(x); bold(y)) in RR^n$ with $bold(x) in RR^(n-m)$ and $bold(y) in RR^m$, suppose $bold(F) mat(delim: "(", bold(x)_0; bold(y)_0) = bold(arrow(0))$ describes a series of $m$ implicit equations and $frac(diff bold(F), diff bold(y)) mat(delim: "(", bold(x)_0; bold(y)_0) in cal(M)_(m times m)$ is invertible.

Then, $exists$ two neighborhoods, $V$ of $bold(x)_0$ and $W$ of $bold(y)_0$ and a $cal(C)^1$ function between them $bold(phi.alt): V -> W$ so that for all $bold(x) in V$ and $bold(y) in W$,

$ bold(F) mat(delim: "(", bold(x); bold(y)) = bold(arrow(0)) <==> bold(y) = bold(phi.alt)(bold(x)) $

Furthermore,

$ D bold(phi.alt)(bold(x)) = -lr((frac(diff bold(F), diff bold(y)) mat(delim: "(", bold(x); bold(phi.alt)(bold(x)))))^(-1) lr((frac(diff bold(F), diff bold(x)) mat(delim: "(", bold(x); bold(phi.alt)(bold(x))))) $

It helps to keep track of dimensions. $frac(diff bold(F), diff bold(y))$ is an $m times m$ matrix (differentiating _m_ functions w.r.t _m_ variables), $frac(diff bold(F), diff bold(x))$ is an $m times (n - m)$ matrix (differentiating _m_ functions w.r.t. _(n-m)_ variables), so $D bold(phi.alt)(bold(x)) in cal(M)_(m times (n - m))$.

== 6.3 Manifolds Revisited

Manifolds are essentially special surfaces which are smooth and are very nice to deal with when doing calculus.

There are three equivalent definitions for a k-dimensional manifold _M_.

1. *Explicit:* a graph of a smooth function
2. *Implicit:* solutions to an implicit set of equations
3. *Parametric:* parameterized by an injective function that never has velocity 0.

more formally

1. For any $bold(p) in M$, $exists$ a neighborhood $W subset RR^n$ of $bold(p)$ so that $W sect M$ is the graph of a smooth function $bold(f): V subset RR^k -> RR^(n-k)$, where $V$ is open. Remember that $"graph"{bold(f)(bold(x))} = {mat(delim: "[", bold(x); bold(f)(bold(x))) : bold(x) in RR^k}$, but that the order of the $x_i$'s doesn't matter.
2. For any $bold(p) in M$, $exists$ a neighborhood $W subset RR^n$ of $bold(p)$ and a smooth function $bold(F): W -> RR^(n-k)$ so that the preimage (level set) $bold(F)^(-1)(bold(arrow(0))) = W sect M$ and $"rank"{D bold(F)(bold(x))} = n - k$ for every $bold(x) in W sect M$.
3. For any $bold(p) in M$, $exists$ a neighborhood $W subset RR^n$ of $bold(p)$ so that $W sect M$ is the image of a smooth function $bold(g): U subset RR^k -> RR^n$, where $U$ is open. $bold(g)$ must be injective, have $"rank"{D bold(g)(bold(u))} = k$ for all $bold(u) in U$, and have $bold(g)^(-1): W sect M -> U$ be continuous.

We can also find the tangent planes at $bold(p)$ to each respective manifold ($T_(bold(p)) M$) as follows

1. If $M$ is locally at $bold(p)$ a graph of $bold(f)$ with $bold(p) = mat(delim: "[", bold(a); bold(f)(bold(a)))$, then $T_(bold(p)) M = "graph"{D bold(f)(bold(a))}$.
2. If $M$ is locally a preimage of $bold(F)$, then $T_(bold(p)) M = "ker"{D bold(F)(bold(p))}$.
3. If $M$ is locally parameterized by $bold(g)$ with $bold(p) = bold(g)(bold(a))$, then $T_(bold(p)) M = "im"{D bold(g)(bold(a))}$

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 7: Integration

== 7.1 Multiple Integrals

=== Defining Integrability (in higher dimensions)

To extend our notion of integration into multiple dimensions, we will be working with something called the Darboux integral. It is much like our notion of 2-D area under the curve, but generalizes to volumes of surfaces/hypersurfaces.

Given a rectangle $R subset RR^n$, you can slice up the rectangle into subrectangles into a partition $cal(P) := cal(P)_1 times dots.c times cal(P)_n$ (each $cal(P)_i$ for $1 <= i <= n$ is like a list of points where to slice the rectangle in the corresponding dimension), where each $R_(i, j)$ of $cal(P)$ is the i-jth rectangle of $R$. Although for $RR^n$ it should be more like the $(i, j, k, dots, n)$-th rectangle of $R$ for all the _n_ coordinates needed to specify which subrectangle it is. For ease of notation I'll stick with $R_(i, j)$.

Recall that for a bounded function $f: R -> RR$, $sup_(bold(x) in S) f(bold(x))$ is the "least upper bound" and $inf_(bold(x) in S) f(bold(x))$ is the "greatest lower bound" of _f_ on S. That is to say, _sup_ is like a maximum of _f_ and _inf_ is like a minimum of _f_ (although the function might never reach their respective values, only approach them).

We then define two possible sums on a partition $cal(P)$, the upper and lower sums. First, we define a sort of minimum/maximum for a subrectangle $R_(i,j)$ to be $m_(i,j) := inf_(bold(x) in R_(i, j)) f(bold(x))$ and $M_(i,j) := sup_(bold(x) in R_(i, j)) f(bold(x))$, respectively. Then, the lower sum of a partition is $L(f, cal(P)) := sum_(i, j) m_(i, j) "area"(R_(i,j))$ and the upper sum is $U(f, cal(P)) := sum_(i, j) M_(i, j) "area"(R_(i,j))$.

Finally, we define integrability. $f$ is integrable on $R$ if for all partitions $cal(P)$ of $R$ there is a _unique_ number $I$ satisfying $L(f, cal(P)) <= I <= U(f, cal(P))$. If $f$ is integrable we say $integral_R f dif V := I$.

=== Proving Integrability

A nice way to prove integrability is the convenient criterion. If $f$ is bounded on $R$, $f$ is integrable on $R$ iff $forall epsilon > 0$, $exists$ a partition $cal(P)$ of $R$ such that $U(f, cal(P)) - L(f, cal(P)) < epsilon$.

If $f$ is continuous, and only discontinuous on a set of volume 0, then $f$ is integrable. $X$ having volume 0 means that $exists$ finite $R_1, dots, R_s$ so that $X subset R_1 union dots union R_s$ and $"vol"(R_1) + dots + "vol"(R_s) < epsilon$ for any $epsilon > 0$.

=== Regions

A subset $Omega$ is a region if it is the closure of a bounded open subset of $RR^n$ and its boundary has volume 0. In other words, if $Omega = overline(U)$ for some open $U$, and $diff Omega$ has volume 0.

To integrate $f$ over a region $Omega$, we pick a rectangle $R$ with $Omega subset R$. Then, we define $tilde(f) = cases(f(bold(x)) &"if" x in Omega, 0 &"otherwise")$.

Then, $integral_Omega f dif V = integral_R tilde(f) dif V$

The volume of a region $Omega$ is given by $"vol"(Omega) = integral_Omega 1 dif V$

=== Properties of Integrals

1. Integral is linear: $integral_Omega (f + g) dif V = integral_Omega f dif V + integral_Omega g dif V$ and $integral_Omega alpha f dif V = alpha integral_Omega f dif V$
2. Union of sets is sum of integrals: $integral_(A union B) f dif V = integral_A f dif V + integral_B f dif V$
3. Inequalities are maintained: if $f <= g$ on $Omega$, then $integral_Omega f dif V <= integral_Omega g dif V$

== 7.2 Iterated Integrals and Fubini's Theorem

=== Fubini's Theorem

Fubini's Theorem allows us to connect this abstract definition of integration to our familiar definition of integration in single-variable calculus.

In 2 dimensions, it states that if $f$ is integrable on $R = [a, b] times [c, d]$, and the sub-integral $integral_c^d f mat(delim: "(", x; y) dif y$ is integrable, then $integral_R f dif V = integral_a^b integral_c^d f mat(delim: "(", x; y) dif y dif x$. Furthermore, $integral_a^b integral_c^d f mat(delim: "(", x; y) dif y dif x = integral_c^d integral_a^b f mat(delim: "(", x; y) dif x dif y.$

In $n$ dimensions, this generalizes similarly. If $f$ is integrable on $[a_1, b_1] times dots.c times [a_n, b_n]$, and all the subintegrals are integrable, then

$ integral_R f(bold(x)) dif V = integral_(a_1)^(b_1) dots.c integral_(a_n)^(b_n) f(bold(x)) dif x_n dots.c dif x_1 $

and the order of the integrals does not matter.

== 7.3 Polar, Cylindrical, and Spherical Coordinates

There are alternative coordinate systems which can help us solve problems and allow us to exploit symmetry. These are three very specific yet very useful coordinate systems, which we generalize later with the change of variables theorem.

=== Polar Coordinates

Define $bold(g): [0, infinity) times [0, 2 pi) -> RR^2$ by $bold(g) mat(delim: "(", r; theta) = mat(delim: "[", r cos theta; r sin theta) = mat(delim: "[", x; y)$.

Then, $integral_(bold(g)(Omega)) f mat(delim: "(", x; y) dif V_(x, y) = integral_Omega f mat(delim: "(", r; theta) r dif V_(r, theta)$

It is useful to know that $x^2 + y^2 = r^2$

Visually, we think of $r$ being the distance projected radially outward at an angle of $theta$ which rotates clockwise around the origin.

=== Cylindrical Coordinates

Define $bold(g): [0, infinity) times [0, 2 pi) times RR -> RR^3$ by $bold(g) mat(delim: "(", r; theta; z) = mat(delim: "[", r cos theta; r sin theta; z) = mat(delim: "[", x; y; z)$.

Then, $integral_(bold(g)(Omega)) f mat(delim: "(", x; y; z) dif V_(x, y, z) = integral_Omega f mat(delim: "(", r; theta; z) r dif V_(r, theta, z)$

It is useful to know that $x^2 + y^2 = r^2$

Visually, we think of $r$ being the distance projected radially outward at an angle of $theta$ which rotates clockwise around the origin, at a height of $z$.

=== Spherical Coordinates

Define $bold(g): [0, infinity) times [0, pi) times [0, 2 pi) -> RR^3$ by $bold(g) mat(delim: "(", rho; phi; theta) = mat(delim: "[", rho sin phi cos theta; rho sin phi sin theta; rho cos phi) = mat(delim: "[", x; y; z)$.

Then, $integral_(bold(g)(Omega)) f mat(delim: "(", x; y; z) dif V_(x, y, z) = integral_Omega f mat(delim: "(", rho; phi; theta) rho^2 sin phi dif V_(rho, phi, theta)$

It is useful to know that $x^2 + y^2 + z^2 = rho^2$

Visually, we think of $rho$ being the distance projected radially outward at two angles -- $phi$, which starts at the top of the $z$-axis and rotates down to the bottom, and $theta$, which rotates all the way about the $z$-axis.

== 7.4 Physical Applications

Average value of $f$ on $Omega$ is defined to be $overline(f) = frac(1, "vol"(Omega)) integral_Omega f "dVol"$

We can define the integral of a vector _valued_ function $bold(f)$ by $integral_Omega bold(f) "dVol" = mat(delim: "[", integral_Omega f_1 "dVol"; dots.v; integral_Omega f_n "dVol")$

Average value is still $overline(bold(f)) = frac(1, "vol"(Omega)) integral_Omega f "dVol"$

And _center of mass_ of $Omega$ with mass density function $delta(bold(x))$ is defined to be the point $overline(bold(x)) = frac(1, "vol"(Omega)) integral_Omega delta(bold(x)) bold(x) "dVol"$

For a rigid body $Omega$, its _moment of inertia_ about an axis $l$ is defined to be $integral_Omega delta(bold(x)) r^2 "dVol"$, where $r$ is the distance from the point to the axis $l$.

The gravitational force exerted on the origin by a mass $Omega$ is $bold(F) = G integral_Omega delta(bold(x)) frac(bold(x), norm(bold(x))^3) "dVol"$

== 7.5 Determinants and n-Dimensional Volume

=== The Determinant

For every $n >= 1$, there is exactly one function $cal(D): underbrace(RR^n times dots.c times RR^n, n "times") -> RR$ that is alternating, multilinear, and has $cal(D)(bold(e)_1, dots, bold(e)_n) = 1$

*Alternating:*

$ cal(D)(bold(v)_1, dots.c, bold(v)_i, dots.c, bold(v)_j, dots.c, bold(v)_n) = -cal(D)(bold(v)_1, dots.c, bold(v)_j, dots.c, bold(v)_i, dots.c, bold(v)_n) $

*Multilinear* (linear in all inputs)*:*

$ cal(D)(bold(v)_1, dots.c, c bold(v)_i, dots.c, bold(v)_n) = c cal(D)(bold(v)_1, dots.c, bold(v)_i, dots.c, bold(v)_n) $

and

$ cal(D)(bold(v)_1, dots.c, bold(v)_i + bold(v)_i', dots.c, bold(v)_n) = cal(D)(bold(v)_1, dots.c, bold(v)_i, dots.c, bold(v)_n) + cal(D)(bold(v)_1, dots.c, bold(v)_i', dots.c, bold(v)_n) $

*Standard:*

$ cal(D)(bold(e)_1, dots, bold(e)_n) = 1 $

This function is the determinant. For an $n times n$ matrix $A$, $det A = cal(D)(bold(a)_1, dots.c, bold(a)_n)$

=== Properties

1. If two columns of a matrix are equal, $det A = 0$
2. Performing row or column operations on a matrix changes the determinant nicely
  - Swapping two rows or columns leaves $det A' = -det A$
  - Scaling one row or column by $c$ leaves $det A' = c det A$
  - Adding a multiple of one row or column to another leaves $det A' = det A$
3. A is nonsingular $<==> det A != 0$
4. $det(A B) = det(A) det(B)$
5. $det A^(-1) = frac(1, det A)$
6. $det A^T = det A$
7. if A is triangular, $det A$ is the product of the diagonal entries
8. if $T$ is a linear map, and $Omega$ is a region, $"vol"(T(Omega)) = abs(det T) "vol"(Omega)$

*Cofactors:*

The cofactor $c_(i,j) = (-1)^(i+j) det A_(i,j)$, where $A_(i, j) =$ the matrix formed by removing row $i$ and column $j$.

The cofactor matrix $C_A$ is the matrix where $(C_A)_(i,j) = c_(i,j)$

*Cramers Rule:*

The $i^("th")$ coordinate of $bold(x)$ which solves $A bold(x) = bold(b)$ is given by $bold(x)_i = frac(det B_i, det A)$, where $B_i$ is the matrix obtained by replacing the ith column of $A$ by $bold(b)$

*Inverse matrix "formula":*

$ A^(-1) = frac(1, det A) C^T $

*Permutations:*

A permutation $sigma in S_n$ is a bijective mapping $sigma: {1, dots.c, n} -> {1, dots.c, n}$

Set of all permutations is denoted $S_n$

The sign of a permutation $"sign"(sigma) = cases(+1 &"odd # of exchanges", -1 &"even # of exchanges")$

where $"# of exchanges"$ is the number of swaps required to change the ordered list $(1, dots.c, n)$ to $(sigma(1), dots.c, sigma(n))$

=== Formulas for the Determinant

*Expansion by cofactors:*

For any fixed row $i$

$ det A = sum_(j=1)^n a_(i,j) c_(i,j) $

For any fixed column $j$

$ det A = sum_(i=1)^n a_(i,j) c_(i,j) $

*Sum of row/column permutations:*

$ det A = sum_(sigma in S_n) "sign"(sigma) a_(sigma(1), 1) a_(sigma(2), 2) dots.c a_(sigma(n), n) $

$ det A = sum_(sigma in S_n) "sign"(sigma) a_(1, sigma(1)) a_(2, sigma(2)) dots.c a_(n, sigma(n)) $

== 7.6 Change of Variables Theorem

Let $Omega subset RR^n$ be a region and let there be an open $U$ with $Omega subset U$ so that $bold(g): U -> RR^n$ is injective, $cal(C)^1$, and has a derivative that is mostly invertible (only fails to be invertible on a set of volume 0).

if $f: bold(g)(Omega) -> RR$ and $(f compose bold(g)) abs(det D bold(g)): Omega -> RR$ are both integrable, then

$ integral_(bold(g)(Omega)) f(bold(y)) "dVol"_bold(y) = integral_Omega (f compose bold(g))(bold(x)) abs(det D bold(g)(bold(x))) "dVol"_bold(x) $

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 8: Differential Forms and Integration on Manifolds

== 8.2 Differential Forms

=== Linear forms

The basis 1-forms ${dif x_1, dots, dif x_n}$ are defined by $dif x_i (bold(v)) = v_i$.

The set of linear maps from $RR^n$ to $RR$ is an $n$ dimensional vector space $(RR^n)^*$ spanned by the basis 1-forms ${dif x_1, dots, dif x_n}$. This space is the _dual space_ of $RR^n$.

Let $I = (i_1, dots, i_k)$ be a multi-index. Using this, we want to define an alternating, multilinear function $dif bold(x)_I : underbrace(RR^n times dots.c times RR^n, k "times") -> RR$ that takes $k$ vectors in $RR^n$ to $RR$ by $dif bold(x)_I (bold(v)_1, dots, bold(v)_k) = det V_I$, where $V_I$ is formed by taking the $i_1, dots, i_k$th rows of the matrix $mat(delim: "[", arrow.t, , arrow.t; bold(v)_1, dots.c, bold(v)_k; arrow.b, , arrow.b)$. This calculates the volume of the parallelepiped of the vectors $bold(v)_1, dots, bold(v)_k$ projected onto the $x_(i_1), dots, x_(i_k)$ plane.

The set of alternating, multilinear functions from $(RR^n)^k$ to $RR$ is denoted by $Lambda^k (RR^n)^*$. This is the dual space of the exterior power of $RR^n$. This space is spanned by the basis k-forms which are given by all $dif bold(x)_I$ where the $(i_1, dots, i_k)$ are increasing. The dimension of this space $dim(Lambda^k (RR^n)^*) = binom(n, k)$. So every $T in Lambda^k (RR^n)^*$ is described by $binom(n, k)$ coefficients $a_I$ so that $T = sum_(I "increasing") a_I dif bold(x)_I$.

The wedge product $and.big: Lambda^k (RR^n)^* times Lambda^l (RR^n)^* -> Lambda^(k+l) (RR^n)^*$ can be defined in multiple ways for two forms $omega = sum_(I "increasing") a_I dif bold(x)_I in Lambda^k (RR^n)^*$ and $eta = sum_(J "increasing") b_J dif bold(x)_J in Lambda^l (RR^n)^*$.

*1.) Concatenation:*

For the basis forms, we simply concatenate the multi-indices so that $dif bold(x)_I and.big dif bold(x)_J = dif bold(x)_((I, J)) = dif bold(x)_((i_1, dots, i_k, j_1, dots, j_l))$. By linearity then, we have $omega and.big eta = sum_(I "increasing") sum_(J "increasing") (a_I b_J) dif bold(x)_((I,J))$.

*2.) Alternization of Tensor Product:*

$omega and.big eta = "alt"(omega times.circle eta)$,

where $times.circle$ is the tensor product which is defined by $(omega times.circle eta)(bold(v)_1, dots, bold(v)_(k+l)) = omega(bold(v)_1, dots, bold(v)_k) dot eta(bold(v)_(k+1), dots, bold(v)_(k+l))$

and $"alt"$ is the alternization for a multilinear $gamma: (RR^n)^k -> RR$ defined by $"alt"(gamma)(bold(v)_1, dots, bold(v)_k) = sum_(sigma in S_k) "sign"(sigma) gamma(bold(v)_(sigma(1)), dots, bold(v)_(sigma(k)))$.

Note that every $dif bold(x)_I = dif x_(i_1) and.big dots.c and.big dif x_(i_k)$

*Properties:*

$ omega in Lambda^k (RR^n)^*, eta in Lambda^l (RR^n)^*, mu in Lambda^m (RR^n)^* $

1. Bilinear
  - $(omega + eta) and.big mu = omega and.big mu + eta and.big mu$
  - $(c omega) and.big eta = c(omega and.big eta)$
2. Skew-commutative
  - $omega and.big eta = (-1)^(k l) eta and.big omega$
3. Associative
  - $(omega and.big eta) and.big mu = omega and.big (eta and.big mu)$

=== Differential Forms

A differential form associates a function to each of the $binom(n, k)$ basis forms. A differential $k$-form on $RR^n$ is an expression $omega = sum_(I "increasing") f_I (bold(x)) dif bold(x)_I$.

*Special cases:*

A 0-form is a smooth function.

An n-form is an expression of the form $omega = f(bold(x)) dif x_1 and.big dots.c and.big dif x_n$.

The set of $k$ forms on $RR^n$ forms a vector space $cal(A)^k (RR^n)$

*Properties:*

$ omega in cal(A)^k (RR^n), eta in cal(A)^l (RR^n), mu in cal(A)^m (RR^n) $

1. Distributes (when $k = l$)
  - $(omega + eta) and.big mu = omega and.big mu + eta and.big mu$
2. Skew-commutative
  - $omega and.big eta = (-1)^(k l) eta and.big omega$
3. Associative
  - $(omega and.big eta) and.big mu = omega and.big (eta and.big mu)$
4. Associative / commutative (when $k = l = m$)
  - $(omega + eta) + mu = omega + (eta + mu)$
  - $omega + eta = eta + omega$

=== Exterior derivative

The exterior derivative $dif$ allows us to differentiate differential forms. The exterior derivative turns $k$ forms into $k + 1$ forms.

For 0-forms, $f: U subset RR^n -> RR$ we want $dif f(bold(x)) = D f(bold(x))$ as a linear map $RR^n -> RR$. This motivates us to define $dif f = sum_(i=1)^n frac(diff f, diff x_i) dif x_i$

For a general $k$ form $omega = sum_I f_I (bold(x)) dif bold(x)_I$, we define $dif omega = sum_I dif f_I and.big dif bold(x)_I = sum_I sum_(j=1)^n frac(diff f, diff x_j) dif x_j and.big dif x_(i_1) and.big dots.c and.big dif x_(i_k)$

*Properties:*

$omega in cal(A)^k (RR^n), eta in cal(A)^l (RR^n), f in cal(A)^0 (RR^n)$ (smooth function)

1. Distributes (when k = l)
  - $dif(omega + eta) = dif omega + dif eta$
2. Scalar function product rule
  - $dif(f omega) = dif f and.big omega + f dif omega$
3. General product rule
  - $dif(omega and.big eta) = dif omega and.big eta + (-1)^k omega and.big dif eta$
4. Derivative twice is 0
  - $dif(dif omega) = 0$

=== Pullback

Pullback is a sort of differential-forms generalization of the chain rule.

If (for open $U$) $bold(g): U subset RR^m -> RR^n$ is smooth, and $omega in cal(A)^k (RR^n)$, then we define $bold(g)^* omega in cal(A)^k (U)$ in multiple steps

To pull back a 0-form (function), we compose by $bold(g)^* f = f compose bold(g)$

To pull back a basis 1-form, we set $bold(g)^* dif x_i = dif g_i = sum_(j=1)^m frac(diff g_i, diff u_j) dif u_j$

and to pull back a basis k-form, we set

$ bold(g)^* (dif x_(i_1) and.big dots.c and.big dif x_(i_k)) = bold(g)^* dif x_(i_1) and.big dots.c and.big bold(g)^* dif x_(i_k) = dif g_(i_1) and.big dots.c and.big dif g_(i_k) = dif bold(g)_I $

and finally, to take the pullback of a general form, we distribute the pullback so, $bold(g)^* omega = bold(g)^* lr((sum_I f_I (bold(x)) dif bold(x)_I)) = sum_I (f_I compose bold(g))(bold(x)) dif bold(g)_I = sum_I (f_I compose bold(g))(bold(x)) dif g_(i_1) and.big dots.c and.big dif g_(i_k)$

This tells us that

$ bold(g)^* dif bold(x)_I = sum_(J "increasing") det[frac(diff bold(g)_I, diff bold(u)_J)] dif bold(u)_J = sum_(J "increasing") mat(delim: "|", frac(diff g_(i_1), diff u_(j_1)), dots.c, frac(diff g_(i_1), diff u_(j_k)); dots.v, dots.down, dots.v; frac(diff g_(i_k), diff u_(j_1)), dots.c, frac(diff g_(i_k), diff u_(j_k))) dif u_(j_1) and.big dots.c and.big dif u_(j_k) $

also note that $bold(g)^* (dif omega) = dif(bold(g)^* omega)$

=== Defining integration

Given an $n$-form $omega = f(bold(x)) = dif x_1 and.big dots.c and.big dif x_n$ on a region $Omega subset RR^n$, we define $integral_Omega omega := integral_Omega f "dVol"$

With this definition, we can nicely restate the change of variables theorem in a nice way. If $bold(g): Omega subset RR^n -> RR^n$ is smooth, injective, and has $det(D bold(g)) > 0$ on a region $Omega$, then for any $omega in cal(A)^n (RR^n)$ we have $integral_(bold(g)(Omega)) omega = integral_Omega bold(g)^* omega$. This motivates us to define integration on a manifold.

If $bold(g): Omega subset RR^n -> RR^n$ is smooth, injective, and has $"rank"(det D bold(g)) = k$ on a region $Omega$, and only doesn't have this rank on a set of volume 0, then for a parameterized k-dimensional manifold $M = bold(g)(Omega) subset RR^n$ and for any $omega in cal(A)^n (RR^n)$ we define $integral_M omega := integral_Omega bold(g)^* omega$

This is well defined, and has the same result for different parameterizations (as long as both parameterizations orient $M$ in the same way)

== 8.3 Line Integrals and Green's Theorem

We can associate a 1-form in $RR^n$ ($omega = sum f_i dif x_i$) with a vector field $bold(F): RR^n -> RR^n$, where $bold(F)(bold(x)) = mat(delim: "[", f_1(bold(x)); dots.v; f_n(bold(x)))$. Then, if we have a curve $cal(C)$, parameterized by some function $bold(g): [a, b] -> cal(C)$, we can find out how much _work_ is done on a particle traveling on the path $cal(C)$ by the force field $bold(F)$.

This work is given by the line integral $integral_(cal(C)) omega = integral_(cal(C)) f_1(bold(x)) dif x_1 + dots.c + f_n(bold(x)) dif x_n$.

To compute this integral, we pull back via the parameterization $bold(g)$ to get $integral_(bold(g)([a, b])) omega = integral_([a, b]) bold(g)^* (omega) = integral_a^b f_1(bold(g)(t)) g_1'(t) dif t + dots.c + f_n(bold(g)(t)) g_n'(t) dif t = integral_a^b bold(F)(bold(g)(t)) dot nabla bold(g)(t) dif t$

It's common notation to let $bold(s) = bold(g)(t)$ so that $integral_a^b bold(F)(bold(g)(t)) dot nabla bold(g)(t) dif t = integral_a^b bold(F)(bold(s)) dot dif bold(s)$

=== F.T.C for line integrals

For a 1-form $omega$, if we can find a potential 0-form $f$ so that $omega = dif f$, then for any curve $cal(C)$ with endpoints $bold(A), bold(B) in cal(C)$, we have $integral_(cal(C)) omega = f(bold(A)) - f(bold(B))$. In traditional vector notation, if we can find an $f$ so that the force field $bold(F) = nabla f$, then for a curve $cal(C)$ parameterized by a $bold(g): [a, b] -> RR^n$, we have $integral_(cal(C)) bold(F)(bold(s)) dot dif bold(s) = f(bold(g)(b)) - f(bold(g)(a))$.

=== Exactness

A 1-form $omega$ is exact if any of the following equivalent statements are true:

_(The endpoints of a curve $cal(C)$ are denoted $bold(A)$ and $bold(B)$)_

1. $omega = dif f$ for some 0-form $f$
2. For every closed curve (when $bold(A) = bold(B)$), we have $integral_(cal(C)) omega = 0$
3. $integral_(cal(C)) omega$ is path-independent. ($integral_(cal(C)) omega = integral_(cal(C)') omega$ if $cal(C)$ and $cal(C)'$ have the same endpoints)

=== Closedness

A 1-form $omega$ is closed if $dif omega = 0$

=== Simply Connected Regions

- exactness $==>$ closedness
  - because $dif^2 = 0$
- closedness $arrow.r.not$ exactness
  - _except on special regions called "simply connected regions"_
- $X subset RR^n$ is called _simply connected_ if any pair of points can be joined by a piecewise $cal(C)^1$ path (connected), and every closed curve which doesn't intersect itself (every simple curve) in $X$ can be continuously shrunk to a point in $X$.
  - _Intuition_: the subset has no holes
  - Think about an open set. You can draw any closed curve and shrink it. Think about an open set with a hole. If you draw a curve around the hole, you can't shrink the curve to a point anymore
- If $omega$ is a smooth, closed 1-form on a simply connected region $Omega subset RR^2$, then $omega$ is exact.

=== Green's Theorem

*Green's Theorem for a Rectangle:*

For a rectangle $R subset RR^2$, and a 1-form $omega$ on $R$.

$ integral_(diff R) omega = integral_R dif omega $

(Where $diff R$ is counterclockwise)

*Classical Green's Theorem:*

For an $bold(F): RR^2 -> RR^2$, where $bold(F)(x, y) = mat(delim: "[", F_1(x, y); F_2(x, y))$. And for a region $D$ bounded by $C$. Then

$ integral_C F_1(x,y) dif x + F_2(x,y) dif y = integral.double_D lr((frac(diff F_2, diff x) - frac(diff F_1, diff y))) dif x dif y $

*Slight Generalization:*

- If $S subset RR^2$ is parameterized by a rectangle, then $integral_(diff S) omega = integral_S dif omega$.
- Green's Theorem holds for any region $S$ that can be decomposed as a finite union of parameterized rectangles which overlap only along their boundaries.

=== Winding Number

Something fun we can do is count the number of times a parameterized curve $gamma$ "winds" around the origin. We define $"wind"(gamma) = frac(1, 2 pi) integral_gamma frac(-y, x^2 + y^2) dif x + frac(x, x^2 + y^2) dif y$, and this counts the number of times a curve loops counterclockwise around the origin.

== 8.4 Surface Integrals and Flux

=== Parameterized Surface

We can work with special 2-dimensional surfaces in $RR^3$, like spheres, toruses, cylinders, etc.

Suppose we have a surface $S = bold(g)(U)$ parameterized by an injective function $bold(g): U subset RR^2 -> RR^n$ (for a bounded, open $U$) that always has $"rank"(D bold(g)(bold(x))) = 2$. Then $S$ is a _parameterized surface_.

We define the integral of a 2-form $omega in cal(A)^2 (RR^n)$ over this parameterized surface to be $integral_S omega = integral_U bold(g)^* omega$.

=== Orientation

For each tangent plane of $S$, find a positively oriented basis $(bold(u), bold(v))$ (i.e. one where $det(bold(u), bold(v)) > 0$). An orientation for $S$ is a continuously varying notion of what a positively oriented basis for the plane at each point of $S$ should be.

An orientation can be determined in multiple ways.

$S$ has an orientation iff we can choose various parameterizations $bold(g)_i$ of subsets $S_i subset S$ such that $union.big_i S_i = S$ and that at every point $bold(x) in S$ the corresponding $bold(g)_i$ has $det(frac(diff bold(g)_i, diff u_1), frac(diff bold(g)_i, diff u_1)) > 0$ (the tangent vectors of the parameterization form a positively oriented basis).

An orientation can also be determined if we have a 2-form $omega$ which is never 0 on $S$. This is because at each point $bold(x) in S$, we can pick tangent vectors $bold(u), bold(v)$ so that $omega(bold(a))(bold(u), bold(v)) > 0$, which defines a continuously varying notion of what a positively oriented basis for the plane should be.

=== Area Forms

For an oriented surface $S$, it's oriented area 2-form $sigma$ assigns at each point $bold(x) in S$ the signed area of the parallelogram that the tangent vectors at that point span.

In $RR^3$ (where $bold(x) = (x, y, z)$), the area 2-form gives the _surface area_ of a surface $S$. If at each point $bold(x) in S$, the surface $S$ has outward pointing unit normal given by $bold(n)(bold(x)) = mat(delim: "[", n_1(bold(x)); n_2(bold(x)); n_3(bold(x)))$, then the corresponding area 2-form is

$ sigma = n_1(bold(x)) dif y and.big dif z + n_2(bold(x)) dif z and.big dif x + n_3(bold(x)) dif x and.big dif y $

This works because $bold(n)$ is a unit vector, so the area of the plane spanned by tangent vectors $bold(u)$ and $bold(v)$ is given by $det mat(delim: "[", arrow.t, arrow.t, arrow.t; bold(n), bold(u), bold(v); arrow.b, arrow.b, arrow.b)$.
