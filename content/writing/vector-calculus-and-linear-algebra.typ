// title: All of vector calculus and linear algebra
// date: 2025-05-11
// description: A reference sheet for Shifrin's Multivariable Mathematics

#import "../template.typ": *
#show: post

This is a big reference sheet/summary for Theodore Shifrin's Multivariable Mathematics textbook. Much of this was written while taking math 3510 as a freshman in college, which I still consider to be the hardest class I have ever taken. This is not meant to be used to learn from. Actually, this would be a terrible reference to learn from. Instead, it is meant to go over the major points and key ideas of the course, and some fun stuff, mostly as a reference to look back on when studying or after taking the course :)

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 1: Vectors and Matrices

== 1.1 Vectors in $RR^n$

A point in $RR^n$ is an ordered $n$-tuple $(x_1, dots, x_n)$. We associate to it the vector $bold(x) = vec(x_1, x_2, dots.v, x_n)$, visualized as the arrow from the origin to that point. The zero vector $bold(0)$ has all coordinates 0. Two points $A$ and $B$ determine the vector $arrow(A B) = bold(b) - bold(a)$.

=== Length

The _length_ (or _norm_) of $bold(x) in RR^n$ is

$ norm(bold(x)) = sqrt(x_1^2 + x_2^2 + dots.c + x_n^2). $

A _unit vector_ is one with $norm(bold(x)) = 1$. Any nonzero vector can be normalized: $bold(x) \/ norm(bold(x))$ is a unit vector in the direction of $bold(x)$.

=== Scalar Multiplication and Vector Addition

_Scalar multiplication:_ For $c in RR$ and $bold(x) in RR^n$, $c bold(x) = vec(c x_1, dots.v, c x_n)$. This stretches $bold(x)$ by $abs(c)$ and reverses direction if $c < 0$.

Two vectors $bold(x)$ and $bold(y)$ are _parallel_ if one is a scalar multiple of the other.

_Vector addition:_ $bold(x) + bold(y) = vec(x_1 + y_1, dots.v, x_n + y_n)$. Geometrically this is the parallelogram law: place the tail of $bold(y)$ at the head of $bold(x)$.

=== Properties of Vector Arithmetic

For all $bold(x), bold(y), bold(z) in RR^n$ and $c, d in RR$:

1. $bold(x) + bold(y) = bold(y) + bold(x)$
2. $(bold(x) + bold(y)) + bold(z) = bold(x) + (bold(y) + bold(z))$
3. $bold(0) + bold(x) = bold(x)$
4. $bold(x) + (-bold(x)) = bold(0)$
5. $c(d bold(x)) = (c d) bold(x)$
6. $c(bold(x) + bold(y)) = c bold(x) + c bold(y)$
7. $(c + d) bold(x) = c bold(x) + d bold(x)$
8. $1 bold(x) = bold(x)$

== 1.2 Dot Product

The dot product is the central algebraic tool for extracting geometry (angles, lengths, orthogonality) from coordinates.

=== Definition

For $bold(x), bold(y) in RR^n$, the _dot product_ is

$ bold(x) dot bold(y) = x_1 y_1 + x_2 y_2 + dots.c + x_n y_n. $

=== Properties

1. $bold(x) dot bold(y) = bold(y) dot bold(x)$ (commutative)
2. $bold(x) dot bold(x) = norm(bold(x))^2 >= 0$, with equality iff $bold(x) = bold(0)$
3. $(c bold(x)) dot bold(y) = c(bold(x) dot bold(y))$ (homogeneity)
4. $bold(x) dot (bold(y) + bold(z)) = bold(x) dot bold(y) + bold(x) dot bold(z)$ (distributive)

It follows that $norm(bold(x) + bold(y))^2 = norm(bold(x))^2 + 2 bold(x) dot bold(y) + norm(bold(y))^2$.

=== Orthogonality

Vectors $bold(x)$ and $bold(y)$ are _orthogonal_ if $bold(x) dot bold(y) = 0$. In $RR^2$, this is equivalent to perpendicularity (by the Pythagorean theorem).

=== Projection

Given $bold(x), bold(y) in RR^n$ with $bold(y) != bold(0)$, we decompose $bold(x) = bold(x)^parallel + bold(x)^perp$ where $bold(x)^parallel$ is parallel to $bold(y)$ and $bold(x)^perp$ is orthogonal to $bold(y)$:

$ bold(x)^parallel = "proj"_bold(y) bold(x) = frac(bold(x) dot bold(y), norm(bold(y))^2) bold(y), quad bold(x)^perp = bold(x) - frac(bold(x) dot bold(y), norm(bold(y))^2) bold(y). $

The projection picks out the component of $bold(x)$ lying along $bold(y)$.

=== Angle Between Vectors

For nonzero $bold(x), bold(y) in RR^n$, the _angle_ $theta in [0, pi]$ between them satisfies

$ cos theta = frac(bold(x) dot bold(y), norm(bold(x)) norm(bold(y))). $

This is well-defined by the Cauchy-Schwarz inequality.

=== Cauchy-Schwarz Inequality

For any $bold(x), bold(y) in RR^n$,

$ abs(bold(x) dot bold(y)) <= norm(bold(x)) norm(bold(y)), $

with equality iff one vector is a scalar multiple of the other. This guarantees $abs(cos theta) <= 1$.

=== Triangle Inequality

For any $bold(x), bold(y) in RR^n$,

$ norm(bold(x) + bold(y)) <= norm(bold(x)) + norm(bold(y)). $

The length of a side of a triangle cannot exceed the sum of the other two.

== 1.3 Subspaces of $RR^n$

Subspaces are the "linear" subsets of $RR^n$ --- generalizations of lines and planes through the origin.

=== Definition

A set $V subset RR^n$ is a _subspace_ if:

1. $bold(0) in V$
2. $bold(v) in V$ and $c in RR$ implies $c bold(v) in V$ (closed under scalar multiplication)
3. $bold(v), bold(w) in V$ implies $bold(v) + bold(w) in V$ (closed under addition)

=== Key Examples

- The trivial subspace ${bold(0)}$ and $RR^n$ itself.
- A _line_ through the origin: ${t bold(u) : t in RR}$ for nonzero $bold(u)$.
- A _plane_ through the origin: ${s bold(u) + t bold(v) : s, t in RR}$ for nonparallel $bold(u), bold(v)$.
- A _hyperplane_: ${bold(x) in RR^n : bold(A) dot bold(x) = 0}$ for nonzero $bold(A) in RR^n$.

=== Non-examples

A subset that does not contain $bold(0)$, or that is not closed under scaling or addition, is not a subspace. For instance, ${bold(x) in RR^2 : x_2 = 2 x_1 + 1}$ fails all three criteria.

=== Linear Combinations and Span

A _linear combination_ of $bold(v)_1, dots, bold(v)_k in RR^n$ is any vector $c_1 bold(v)_1 + dots.c + c_k bold(v)_k$. The _span_ $"Span"(bold(v)_1, dots, bold(v)_k)$ is the set of all such combinations. The span of any collection of vectors is always a subspace. The standard basis vectors $bold(e)_1, dots, bold(e)_n$ span $RR^n$.

Subspaces arise in two dual ways: _parametrically_ (as a span of vectors) or _implicitly_ (as the solution set of a homogeneous system $bold(A)_i dot bold(x) = 0$).

=== Orthogonal Complement

For a subspace $V subset RR^n$, its _orthogonal complement_ is

$ V^perp = {bold(x) in RR^n : bold(x) dot bold(v) = 0 "for all" bold(v) in V}. $

$V^perp$ is itself a subspace. If $bold(x)$ is orthogonal to each of $bold(v)_1, dots, bold(v)_k$, then $bold(x)$ is orthogonal to every vector in $"Span"(bold(v)_1, dots, bold(v)_k)$.

Two subspaces $V$ and $W$ are _orthogonal subspaces_ if $bold(v) dot bold(w) = 0$ for every $bold(v) in V$ and $bold(w) in W$.

== 1.4 Linear Transformations and Matrix Algebra

=== Linear Transformations

A function $T: RR^n -> RR^m$ is a _linear transformation_ if:

1. $T(bold(u) + bold(v)) = T(bold(u)) + T(bold(v))$ for all $bold(u), bold(v) in RR^n$
2. $T(c bold(v)) = c T(bold(v))$ for all $bold(v) in RR^n$ and $c in RR$

The key consequence is that $T$ is completely determined by its values on the standard basis: $T(bold(x)) = x_1 T(bold(e)_1) + dots.c + x_n T(bold(e)_n)$.

=== Standard Matrix

To each linear map $T: RR^n -> RR^m$ we associate the $m times n$ _standard matrix_ $[T] = A$ whose $j$th column is $T(bold(e)_j)$. Then $T(bold(x)) = A bold(x)$.

The product $A bold(x)$ can be interpreted two ways:
- As a linear combination of the columns of $A$ weighted by the entries of $bold(x)$
- As the vector of dot products of the rows of $A$ with $bold(x)$

=== Examples of Linear Maps

- _Dot product:_ $T(bold(x)) = bold(a) dot bold(x)$ gives $[T] = bold(a)^T$ (a $1 times n$ matrix)
- _Rotation by $theta$:_ standard matrix $A_theta = mat(delim: "[", cos theta, -sin theta; sin theta, cos theta)$
- _Reflection across $x_1 = x_2$:_ standard matrix $mat(delim: "[", 0, 1; 1, 0)$
- _Projection onto a line:_ e.g. onto $"Span" vec(delim: "(", 1, 2)$ gives $mat(delim: "[", 1\/5, 2\/5; 2\/5, 4\/5)$

=== Matrix Algebra

Denote by $cal(M)_(m times n)$ the set of all $m times n$ matrices. Matrix addition and scalar multiplication are defined entry-by-entry and satisfy the same properties as vector arithmetic.

A matrix is _square_ if $m = n$, _diagonal_ if $a_(i j) = 0$ for $i != j$, _upper triangular_ if $a_(i j) = 0$ for $i > j$, and _lower triangular_ if $a_(i j) = 0$ for $i < j$.

=== Matrix Multiplication

Matrix multiplication is defined to correspond to composition of linear maps. If $A$ is $m times n$ and $B$ is $n times p$, then $A B$ is $m times p$ with

$ (A B)_(i j) = sum_(k=1)^n a_(i k) b_(k j) = ("row " i "of" A) dot ("col " j "of" B). $

Equivalently, the $j$th column of $A B$ is $A$ times the $j$th column of $B$.

=== Properties of Matrix Multiplication

For compatible matrices $A, A', B, B', C$ and scalar $c$:

1. $A I_n = A = I_m A$ (identity)
2. $(A + A') B = A B + A' B$ and $A(B + B') = A B + A B'$ (distributive)
3. $(c A) B = c(A B) = A(c B)$
4. $(A B) C = A(B C)$ (associative)

Matrix multiplication is _not_ commutative: in general $A B != B A$.

=== Inverse Matrices

An $n times n$ matrix $A$ is _invertible_ if there exists $A^(-1)$ with $A A^(-1) = A^(-1) A = I_n$. The inverse, when it exists, is unique and represents the inverse of the corresponding linear map.

For a $2 times 2$ matrix $A = mat(delim: "[", a, b; c, d)$ with $a d - b c != 0$:

$ A^(-1) = frac(1, a d - b c) mat(delim: "[", d, -b; -c, a). $

If $A$ and $B$ are invertible, then $(A B)^(-1) = B^(-1) A^(-1)$ (reverse order). To undo two operations, undo them in reverse.

For the rotation matrix: $A_theta^(-1) = A_(-theta)$.

=== The Transpose

The _transpose_ of an $m times n$ matrix $A$ is the $n times m$ matrix $A^T$ whose $i j$-entry is $a_(j i)$ (rows become columns). A square matrix is _symmetric_ if $A^T = A$ and _skew-symmetric_ if $A^T = -A$.

=== Properties of Transpose

1. $(A^T)^T = A$
2. $(c A)^T = c A^T$
3. $(A + A')^T = A^T + A'^T$
4. $(A B)^T = B^T A^T$ (reverse order, like inverses)

=== Dot Product and Transpose

$ bold(x) dot bold(y) = bold(x)^T bold(y) $

To move a matrix across the dot product, transpose it: for $A$ an $m times n$ matrix, $bold(x) in RR^n$, $bold(y) in RR^m$,

$ A bold(x) dot bold(y) = bold(x) dot A^T bold(y). $

== 1.5 Introduction to Determinants and the Cross Product

=== Determinants in $RR^2$

The signed area of the parallelogram spanned by $bold(x), bold(y) in RR^2$ is

$ frak(D)(bold(x), bold(y)) = x_1 y_2 - x_2 y_1 = det mat(delim: "[", x_1, y_1; x_2, y_2). $

The sign is positive when the turn from $bold(x)$ to $bold(y)$ is counterclockwise, negative when clockwise.

=== Determinant Properties ($2 times 2$ and $3 times 3$)

The determinant $frak(D)$ is the unique function of the column vectors satisfying:

1. *Alternating:* swapping two columns negates the determinant. In particular, if two columns are equal, $frak(D) = 0$.
2. *Multilinear:* scaling one column by $c$ scales $frak(D)$ by $c$; $frak(D)$ distributes over addition in each column.
3. *Standard:* $frak(D)(bold(e)_1, dots, bold(e)_n) = 1$.

=== Determinants in $RR^3$

For $bold(x), bold(y), bold(z) in RR^3$:

$ frak(D)(bold(x), bold(y), bold(z)) = x_1 mat(delim: "|", y_2, z_2; y_3, z_3) - x_2 mat(delim: "|", y_1, z_1; y_3, z_3) + x_3 mat(delim: "|", y_1, z_1; y_2, z_2). $

This equals the signed volume of the parallelepiped spanned by $bold(x), bold(y), bold(z)$. It satisfies Properties 1--3 in all three slots.

=== The Cross Product

For $bold(x), bold(y) in RR^3$, the _cross product_ is

$ bold(x) times bold(y) = vec(x_2 y_3 - x_3 y_2, x_3 y_1 - x_1 y_3, x_1 y_2 - x_2 y_1) = mat(delim: "|", bold(e)_1, x_1, y_1; bold(e)_2, x_2, y_2; bold(e)_3, x_3, y_3) $

where the last expression is interpreted formally by cofactor expansion along the first column.

=== Geometric Interpretation

The cross product $bold(x) times bold(y)$ is the unique vector in $RR^3$ satisfying:

1. $bold(x) times bold(y)$ is orthogonal to both $bold(x)$ and $bold(y)$
2. $norm(bold(x) times bold(y))$ equals the area of the parallelogram spanned by $bold(x)$ and $bold(y)$
3. $bold(x), bold(y), bold(x) times bold(y)$ form a right-handed system (positive signed volume)

The relationship to the determinant is $bold(z) dot (bold(x) times bold(y)) = frak(D)(bold(z), bold(x), bold(y))$, so the $3 times 3$ determinant is the scalar triple product.

=== Properties of the Cross Product

1. $bold(x) times bold(y) = -bold(y) times bold(x)$ (anti-commutative)
2. $bold(x) times (bold(y) + bold(z)) = bold(x) times bold(y) + bold(x) times bold(z)$ (distributive)
3. $(c bold(x)) times bold(y) = c(bold(x) times bold(y))$
4. $bold(x) times bold(x) = bold(0)$
5. The cross product is _not_ associative

=== Applications

The normal vector to the plane $"Span"(bold(u), bold(v))$ in $RR^3$ is $bold(A) = bold(u) times bold(v)$, giving the implicit equation $bold(A) dot bold(x) = 0$. For the affine plane through $bold(x)_0$ parallel to $"Span"(bold(u), bold(v))$: $bold(A) dot (bold(x) - bold(x)_0) = 0$.

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 2: Functions, Limits, and Continuity

== 2.1 Scalar- and Vector-Valued Functions

=== Parametrized Curves

A parametrized curve is a vector-valued function of a single variable $bold(f): (a, b) -> RR^n$, where we think of the independent variable $t$ as time and $bold(f)(t)$ as the position of a particle at time $t$.

A line through $bold(x)_0$ with direction vector $bold(v)$ is parametrized by $bold(f)(t) = bold(x)_0 + t bold(v)$, $t in RR$.

A circle of radius $a$ is parametrized by $bold(f)(t) = a vec(cos t, sin t)$, $0 <= t <= 2 pi$. More generally, the ellipse $x^2 / a^2 + y^2 / b^2 = 1$ is parametrized by $bold(f)(t) = vec(a cos t, b sin t)$.

The cycloid -- the trajectory of a point on a rolling wheel of radius $a$ -- is parametrized by

$ bold(f)(t) = a vec(t - sin t, 1 - cos t), quad t in RR $

=== Scalar Functions of Several Variables

A scalar-valued function of $n$ variables $f: RR^n -> RR$ can be visualized by its graph

$ "graph"(f) = {vec(bold(x), f(bold(x))) : bold(x) in RR^n} subset RR^(n+1) $

and by its level curves (or contour curves), which are the sets ${bold(x) : f(bold(x)) = c}$ for constants $c$.

=== Vector Functions of Several Variables

A vector-valued function $bold(f): RR^n -> RR^m$ can always be viewed as a collection of $m$ scalar functions:

$ bold(f) vec(x_1, dots.v, x_n) = vec(f_1(bold(x)), dots.v, f_m(bold(x))) $

Key examples include coordinate changes such as polar coordinates $bold(f) vec(r, theta) = vec(r cos theta, r sin theta)$ and parametrized surfaces.

== 2.2 A Bit of Topology in $RR^n$

=== Open Balls and Neighborhoods

The ball of radius $delta$ centered at $bold(a)$ is $B(bold(a), delta) = {bold(x) in RR^n : norm(bold(x) - bold(a)) < delta}$, also called a neighborhood of $bold(a)$.

The key relationship between balls and coordinates: if $|x_i - a_i| < delta / sqrt(n)$ for all $i$, then $bold(x) in B(bold(a), delta)$. Conversely, if $bold(x) in B(bold(a), delta)$, then $|x_i - a_i| < delta$ for all $i$.

=== Open and Closed Sets

A subset $U subset RR^n$ is *open* if for every $bold(a) in U$ there exists $delta > 0$ so that $B(bold(a), delta) subset U$. Intuitively, every point has "room to breathe" -- you can wiggle in any direction and stay inside the set.

1. An open interval $(a, b) subset RR$ is open.
2. An open rectangle $(a_1, b_1) times dots.c times (a_n, b_n) subset RR^n$ is open.
3. $RR^n$ and $nothing$ are both open (and both closed).

=== Sequences and Convergence

A sequence ${bold(x)_k}$ in $RR^n$ converges to $bold(a)$ (written $bold(x)_k -> bold(a)$ or $lim_(k -> infinity) bold(x)_k = bold(a)$) if for all $epsilon > 0$, there exists $K in NN$ such that

$ norm(bold(x)_k - bold(a)) < epsilon quad "whenever" k > K $

Convergence in $RR^n$ is equivalent to componentwise convergence: $bold(x)_k -> bold(a)$ if and only if $x_(k,i) -> a_i$ for all $i = 1, dots, n$.

=== Least Upper Bound Property

Every nonempty subset $S subset RR$ that is bounded above has a least upper bound $sup S$. A bounded, nondecreasing sequence of real numbers converges to the supremum of its values.

=== Closed Sets

A subset $S subset RR^n$ is *closed* if whenever a convergent sequence ${bold(x)_k}$ with $bold(x)_k in S$ for all $k$ converges to $bold(a)$, then $bold(a) in S$. Equivalently, $S$ is closed if and only if its complement $RR^n - S$ is open. Closed sets are "limit-closed": they contain all their limit points.

1. Closed intervals $[a, b]$, closed rectangles $[a_1, b_1] times dots.c times [a_n, b_n]$, and closed balls $overline(B)(bold(a), r) = {bold(x) in RR^n : norm(bold(x) - bold(a)) <= r}$ are closed.
2. Most sets are neither open nor closed. For example, $(0, 1] subset RR$ is neither.
3. Finite unions and finite intersections of open sets are open; finite unions and finite intersections of closed sets are closed.

=== Closure, Interior, and Frontier

The *closure* $overline(S)$ of $S subset RR^n$ is the smallest closed set containing $S$ -- equivalently, $S$ together with all limits of convergent sequences of points in $S$.

A point $bold(a) in S$ is an *interior point* if some neighborhood of $bold(a)$ is contained in $S$. A point $bold(a) in RR^n$ is a *frontier point* of $S$ if every neighborhood of $bold(a)$ contains both points in $S$ and points not in $S$. The set of frontier points is always closed, and $overline(S) = S union {"frontier points of" S}$.

=== Cauchy Sequences and Completeness

A sequence ${bold(x)_k}$ is *Cauchy* if for all $epsilon > 0$ there exists $K in NN$ so that $norm(bold(x)_k - bold(x)_ell) < epsilon$ whenever $k, ell > K$. Every convergent sequence is Cauchy, and $RR^n$ is *complete*: every Cauchy sequence converges.

Any sequence in a closed, bounded subset of $RR^n$ has a convergent subsequence (the Bolzano-Weierstrass property).

== 2.3 Limits and Continuity

=== Limits of Functions

Let $U subset RR^n$ be open, containing a neighborhood of $bold(a)$ (except perhaps $bold(a)$ itself), and let $bold(f): U -> RR^m$. We say $lim_(bold(x) -> bold(a)) bold(f)(bold(x)) = bold(ell)$ if for every $epsilon > 0$ there exists $delta > 0$ so that

$ norm(bold(f)(bold(x)) - bold(ell)) < epsilon quad "whenever" quad 0 < norm(bold(x) - bold(a)) < delta $

The key subtlety in higher dimensions: $bold(x)$ can approach $bold(a)$ from infinitely many directions, not just from the left or right. To show a limit does not exist, it suffices to find two paths approaching $bold(a)$ along which the function approaches different values.

=== Componentwise Limits

$lim_(bold(x) -> bold(a)) bold(f)(bold(x)) = bold(ell)$ if and only if $lim_(bold(x) -> bold(a)) f_j (bold(x)) = ell_j$ for all $j = 1, dots, m$. This reduces vector-valued limits to scalar-valued limits.

=== Limit Laws

Suppose $lim_(bold(x) -> bold(a)) bold(f)(bold(x)) = bold(ell)$, $lim_(bold(x) -> bold(a)) bold(g)(bold(x)) = bold(m)$, and $lim_(bold(x) -> bold(a)) k(bold(x)) = c$. Then:

1. $lim_(bold(x) -> bold(a)) (bold(f)(bold(x)) + bold(g)(bold(x))) = bold(ell) + bold(m)$
2. $lim_(bold(x) -> bold(a)) bold(f)(bold(x)) dot bold(g)(bold(x)) = bold(ell) dot bold(m)$
3. $lim_(bold(x) -> bold(a)) k(bold(x)) bold(f)(bold(x)) = c bold(ell)$

=== Continuity

Let $U subset RR^n$ be open and $bold(f): U -> RR^m$. Then $bold(f)$ is *continuous at* $bold(a)$ if $lim_(bold(x) -> bold(a)) bold(f)(bold(x)) = bold(f)(bold(a))$, i.e., for every $epsilon > 0$ there exists $delta > 0$ so that

$ norm(bold(f)(bold(x)) - bold(f)(bold(a))) < epsilon quad "whenever" quad norm(bold(x) - bold(a)) < delta $

We say $bold(f)$ is *continuous* if it is continuous at every point of its domain. Continuity means the limit equals the function value -- no jumps, no holes.

=== Algebraic Properties

If $bold(f), bold(g): U -> RR^m$ and $k: U -> RR$ are all continuous at $bold(a)$, then so are $bold(f) + bold(g)$, $bold(f) dot bold(g)$, and $k bold(f)$. Every linear map $T: RR^n -> RR^m$ is continuous.

=== Topological Characterization

$bold(f): U -> RR^m$ (with $U$ open) is continuous if and only if for every open set $V subset RR^m$, the preimage $bold(f)^(-1)(V) = {bold(x) in U : bold(f)(bold(x)) in V}$ is open. This is the "open preimage" characterization -- it is often the cleanest way to prove continuity results.

=== Composition

If $bold(g): W -> RR^n$ and $bold(f): U -> RR^m$ are continuous and the composition is defined (i.e., $bold(g)(bold(x)) in U$ for all $bold(x) in W$), then $bold(f) compose bold(g)$ is continuous. This follows immediately from the open preimage characterization.

=== Sequential Characterization

$bold(f)$ is continuous at $bold(a)$ if and only if for every sequence ${bold(x)_k}$ converging to $bold(a)$, the sequence ${bold(f)(bold(x)_k)}$ converges to $bold(f)(bold(a))$. This is often the most practical tool for proving a function is *not* continuous: find a sequence approaching $bold(a)$ whose images do not approach $bold(f)(bold(a))$.

=== Closed Level Sets

If $bold(f): RR^n -> RR^m$ is continuous, then for any $bold(c) in RR^m$, the level set $bold(f)^(-1)({bold(c)}) = {bold(x) in RR^n : bold(f)(bold(x)) = bold(c)}$ is a closed set. For example, the spheres ${bold(x) : norm(bold(x)) = r}$ are closed because $f(bold(x)) = norm(bold(x))^2$ is continuous.

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 3: The Derivative

== 3.1 Partial Derivatives and Directional Derivatives

=== Partial Derivatives

Partial derivatives measure the rate of change of a function along coordinate axes, reducing multivariable problems to single-variable ones.

For $U subset RR^n$ open, $bold(a) in U$, and $bold(f): U -> RR^m$, the $j^("th")$ partial derivative of $bold(f)$ at $bold(a)$ is

$ frac(diff bold(f), diff x_j)(bold(a)) = lim_(t -> 0) frac(bold(f)(bold(a) + t bold(e)_j) - bold(f)(bold(a)), t), quad j = 1, dots, n $

provided this limit exists. Alternative notation: $D_j f(bold(a))$.

=== Directional Derivatives

The directional derivative generalizes partial derivatives to arbitrary directions, not just coordinate axes.

For $U subset RR^n$ open, $bold(a) in U$, and $bold(v) in RR^n$ nonzero, the directional derivative of $bold(f): U -> RR^m$ at $bold(a)$ in the direction $bold(v)$ is

$ D_(bold(v)) bold(f)(bold(a)) = lim_(t -> 0) frac(bold(f)(bold(a) + t bold(v)) - bold(f)(bold(a)), t) $

provided this limit exists. The $j^("th")$ partial derivative is just $D_(bold(e)_j) bold(f)(bold(a))$.

The directional derivative depends on both the direction and magnitude of $bold(v)$: $D_(c bold(v)) bold(f)(bold(a)) = c D_(bold(v)) bold(f)(bold(a))$. Think of it as the rate of change perceived by an observer moving with instantaneous velocity $bold(v)$.

== 3.2 Differentiability

=== The Total Derivative

Having partial derivatives (or even all directional derivatives) does not guarantee continuity. The correct notion of differentiability requires a best linear approximation.

For $U subset RR^n$ open, $bold(a) in U$, a function $bold(f): U -> RR^m$ is _differentiable_ at $bold(a)$ if there is a linear map $D bold(f)(bold(a)): RR^n -> RR^m$ such that

$ lim_(bold(h) -> bold(0)) frac(bold(f)(bold(a) + bold(h)) - bold(f)(bold(a)) - D bold(f)(bold(a)) bold(h), norm(bold(h))) = bold(0) $

This says the error in the linear approximation $bold(f)(bold(a)) + D bold(f)(bold(a))(bold(x) - bold(a))$ vanishes faster than $norm(bold(x) - bold(a))$. The graph of $bold(g)(bold(x)) = bold(f)(bold(a)) + D bold(f)(bold(a))(bold(x) - bold(a))$ is the tangent plane at $bold(a)$.

The derivative $D bold(f)(bold(a))$, if it exists, is unique. A vector-valued function $bold(f)$ is differentiable at $bold(a)$ iff each of its coordinate functions $f_i$ is differentiable at $bold(a)$.

=== The Jacobian Matrix

If $bold(f): RR^n -> RR^m$ is differentiable at $bold(a)$, then the partial derivatives $frac(diff f_i, diff x_j)(bold(a))$ exist and the matrix representation of $D bold(f)(bold(a))$ is

$ [D bold(f)(bold(a))] = mat(delim: "[", frac(diff f_i, diff x_j)(bold(a))) $

This $m times n$ matrix is the _Jacobian matrix_ of $bold(f)$ at $bold(a)$.

=== Key Results

1. *Differentiable implies continuous:* If $bold(f): RR^n -> RR^m$ is differentiable at $bold(a)$, then $bold(f)$ is continuous at $bold(a)$.

2. *Directional derivatives from the total derivative:* When $bold(f)$ is differentiable at $bold(a)$, for any $bold(v) in RR^n$, $D_(bold(v)) bold(f)(bold(a)) = D bold(f)(bold(a)) bold(v)$.

3. *$cal(C)^1$ implies differentiable:* If $bold(f): U -> RR^m$ has continuous partial derivatives (i.e., $bold(f)$ is $cal(C)^1$), then $bold(f)$ is differentiable. This is the practical workhorse: to show differentiability, just check that partials exist and are continuous.

The converse of (3) is false: a function can be differentiable everywhere yet not $cal(C)^1$ (e.g. $f(x) = x^2 sin(1\/x)$).

== 3.3 Differentiation Rules

=== Operator Norm

The norm of a linear map $T: RR^n -> RR^m$ is $norm(T) = max_(norm(bold(x)) = 1) norm(T(bold(x)))$. This gives the bound $norm(T(bold(x))) <= norm(T) norm(bold(x))$.

=== Sum, Product, and Dot Product Rules

Suppose $U subset RR^n$ is open, $bold(f), bold(g): U -> RR^m$, $k: U -> RR$, and all are differentiable at $bold(a) in U$.

1. *Sum rule:* $D(bold(f) + bold(g))(bold(a)) = D bold(f)(bold(a)) + D bold(g)(bold(a))$

2. *Scalar-vector product rule:* $D(k bold(f))(bold(a)) bold(v) = (D k(bold(a)) bold(v)) bold(f)(bold(a)) + k(bold(a)) D bold(f)(bold(a)) bold(v)$

3. *Dot product rule:* $D(bold(f) dot bold(g))(bold(a)) bold(v) = (D bold(f)(bold(a)) bold(v)) dot bold(g)(bold(a)) + bold(f)(bold(a)) dot (D bold(g)(bold(a)) bold(v))$

=== The Chain Rule

The chain rule is the fundamental tool for computing derivatives of compositions. It says: differentiate the outer function at the output, then compose with the derivative of the inner function.

If $bold(g): RR^n -> RR^m$ is differentiable at $bold(a)$ and $bold(f): RR^m -> RR^ell$ is differentiable at $bold(g)(bold(a))$, then $bold(f) compose bold(g)$ is differentiable at $bold(a)$ and

$ D(bold(f) compose bold(g))(bold(a)) = D bold(f)(bold(g)(bold(a))) compose D bold(g)(bold(a)) $

In matrix form, the Jacobian of the composition is the product of Jacobians. This also gives an alternative derivation of $D_(bold(v)) bold(f)(bold(a)) = D bold(f)(bold(a)) bold(v)$: take $bold(g)(t) = bold(a) + t bold(v)$ and apply the chain rule to $bold(f) compose bold(g)$.

More generally, if $bold(g)$ is any differentiable function with $bold(g)(0) = bold(a)$ and $bold(g)'(0) = bold(v)$, then $D_(bold(v)) bold(f)(bold(a)) = (bold(f) compose bold(g))'(0)$.

== 3.4 The Gradient

=== Definition and Directional Derivative Formula

The gradient recasts the derivative of a scalar function as a vector, enabling geometric interpretation via dot products.

If $f: RR^n -> RR$ is differentiable at $bold(a)$, the _gradient_ of $f$ at $bold(a)$ is

$ nabla f(bold(a)) = (D f(bold(a)))^top = vec(frac(diff f, diff x_1)(bold(a)), frac(diff f, diff x_2)(bold(a)), dots.v, frac(diff f, diff x_n)(bold(a))) $

The directional derivative is then a dot product:

$ D_(bold(v)) f(bold(a)) = nabla f(bold(a)) dot bold(v) $

=== Steepest Ascent

By Cauchy-Schwarz, the gradient points in the direction of greatest increase, and its magnitude is the maximum rate of change.

If $f$ is differentiable at $bold(a)$ and $nabla f(bold(a)) != bold(0)$, then

$ norm(nabla f(bold(a))) = max_(norm(bold(v)) = 1) D_(bold(v)) f(bold(a)) $

with the maximum attained when $bold(v) = nabla f(bold(a)) \/ norm(nabla f(bold(a)))$.

=== Normal to Level Sets

If $f: RR^n -> RR$ is differentiable at $bold(a)$ and $nabla f(bold(a)) != bold(0)$, then $nabla f(bold(a))$ is orthogonal to the level set ${bold(x) in RR^n : f(bold(x)) = f(bold(a))}$ at $bold(a)$. This is immediate: any tangent vector $bold(v)$ to the level set satisfies $D_(bold(v)) f(bold(a)) = 0$, so $nabla f(bold(a)) dot bold(v) = 0$.

For a level surface $f(bold(x)) = c$ in $RR^3$, the tangent plane at $bold(a)$ has equation $nabla f(bold(a)) dot (bold(x) - bold(a)) = 0$.

== 3.5 Curves

=== Velocity, Speed, and Acceleration

A parametrized curve $bold(g): (a, b) -> RR^n$ describes the trajectory of a particle. $bold(g)'(t)$ is the _velocity vector_, $norm(bold(g)'(t))$ is the _speed_, and $bold(g)''(t)$ is the _acceleration vector_.

Newton's second law: $bold(F) = m bold(a)$.

If $bold(g)(t)$ has constant length (lies on a sphere centered at the origin), then $bold(g)(t) dot bold(g)'(t) = 0$ for all $t$. Intuitively, the velocity must be tangent to the sphere.

=== Central Force Fields

A force field $bold(F)(bold(x)) = psi(bold(x)) bold(x)$ is called _central_. The gravitational field of a point mass $M$ at the origin is $bold(F)(bold(x)) = -(G M) / norm(bold(x))^3 bold(x)$.

In a central force field, the trajectory of any particle lies in a plane. If the trajectory is not a line, the position vector sweeps out area at a constant rate: $cal(A)'(t) = 1/2 norm(bold(g)(t) times bold(g)'(t)) = "const"$ (Kepler's second law generalized).

=== Arclength

For a piecewise-$cal(C)^1$ curve $bold(g): [a, b] -> RR^n$, the arclength is

$ ell(bold(g)) = integral_a^b norm(bold(g)'(t)) dif t $

The arclength function $s(t) = integral_a^t norm(bold(g)'(u)) dif u$ satisfies $s'(t) = norm(bold(g)'(t))$ (the speed).

=== Arclength Parametrization and Curvature

A curve is _arclength-parametrized_ if $norm(bold(g)'(s)) = 1$ for all $s$. In this case, the velocity $bold(g)'(s) = bold(T)(s)$ is the _unit tangent vector_.

The _curvature_ is $kappa(s) = norm(bold(T)'(s))$. The _principal normal_ is $bold(N)(s) = bold(T)'(s) \/ norm(bold(T)'(s))$ (defined when $kappa != 0$). Since $norm(bold(T)) = 1$, we have $bold(T) dot bold(T)' = 0$, so $bold(N) perp bold(T)$.

1. A line has $kappa = 0$ everywhere, and conversely.
2. A circle of radius $a$ has constant curvature $kappa = 1\/a$ and centripetal principal normal.

=== Acceleration Decomposition

For a general (not arclength) parametrization with speed $upsilon(t) = norm(bold(g)'(t))$:

$ bold(g)'(t) = upsilon(t) bold(T)(s(t)) $

$ bold(g)''(t) = upsilon'(t) bold(T)(s(t)) + kappa(s(t)) upsilon(t)^2 bold(N)(s(t)) $

Acceleration decomposes into a tangential component $upsilon'$ (change of speed) and a normal component $kappa upsilon^2$ (centripetal, from change of direction).

=== Frenet Formulas (in $RR^3$)

For an arclength-parametrized curve in $RR^3$ with $kappa > 0$, define the _binormal_ $bold(B) = bold(T) times bold(N)$. The _torsion_ $tau$ is defined by $bold(B)' = -tau bold(N)$. The curve is planar iff $tau = 0$ everywhere.

$ bold(T)' = kappa bold(N), quad bold(N)' = -kappa bold(T) + tau bold(B), quad bold(B)' = -tau bold(N) $

== 3.6 Higher-Order Partial Derivatives

=== $cal(C)^k$ Functions

The second-order partial derivatives of $bold(f)$ are

$ frac(diff^2 bold(f), diff x_j diff x_i) = frac(diff, diff x_j)(frac(diff bold(f), diff x_i)) $

$bold(f)$ is $cal(C)^k$ on $U$ if all partial derivatives up to order $k$ exist and are continuous on $U$. $bold(f)$ is $cal(C)^infinity$ (smooth) if all partial derivatives of all orders exist.

=== Equality of Mixed Partials (Clairaut's Theorem)

For smooth enough functions, the order of differentiation doesn't matter.

If $U subset RR^n$ is open and $bold(f): U -> RR^m$ is $cal(C)^2$, then for any $i, j$

$ frac(diff^2 bold(f), diff x_i diff x_j) = frac(diff^2 bold(f), diff x_j diff x_i) $

The $cal(C)^2$ hypothesis is necessary: there exist functions with $frac(diff^2 f, diff x diff y)(bold(0)) != frac(diff^2 f, diff y diff x)(bold(0))$ that fail to be $cal(C)^2$.

=== Important PDEs

1. *Laplacian and harmonic functions:* $nabla^2 f = frac(diff^2 f, diff x_1^2) + dots.c + frac(diff^2 f, diff x_n^2)$. A function satisfying $nabla^2 f = 0$ is _harmonic_.

2. *Wave equation:* $frac(diff^2 f, diff t^2) = c^2 frac(diff^2 f, diff x^2)$. General solution via change of variables: $f(x, t) = phi(x + c t) + psi(x - c t)$, the superposition of two traveling waves.

3. *Minimal surface equation:* $(1 + (frac(diff f, diff y))^2) frac(diff^2 f, diff x^2) - 2 frac(diff f, diff x) frac(diff f, diff y) frac(diff^2 f, diff x diff y) + (1 + (frac(diff f, diff x))^2) frac(diff^2 f, diff y^2) = 0$

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 4: Implicit and Explicit Solutions of Linear Systems

Any subspace $V subset RR^n$ has two representations: _explicit_ (parametric), where $V = "Span"(bold(v)_1, dots, bold(v)_k)$, and _implicit_, where $V = {bold(x) in RR^n : A bold(x) = bold(0)}$ for some matrix $A$. This chapter develops the machinery to pass between them.

== 4.1 Gaussian Elimination and the Theory of Linear Systems

=== Setup

A system of $m$ linear equations in $n$ unknowns can be written $A bold(x) = bold(b)$ with $A in cal(M)_(m times n)$. Geometrically, a solution is a point in the intersection of $m$ hyperplanes with normal vectors $bold(A)_1, dots, bold(A)_m$ (the row vectors of $A$).

The _augmented matrix_ $[A | bold(b)]$ encodes the full system. Three _elementary row operations_ preserve the solution set:

1. Interchange two rows
2. Multiply a row by a nonzero scalar
3. Add a scalar multiple of one row to another

=== Echelon Form

A matrix is in _echelon form_ if (1) leading entries move strictly to the right in successive rows, (2) all entries below each leading entry are 0, and (3) all zero rows are at the bottom.

A matrix is in _reduced echelon form_ if additionally (4) every leading entry is 1, and (5) all entries _above_ each leading entry are 0.

The columns containing leading entries (pivots) are _pivot columns_; the corresponding variables are _pivot variables_. The remaining variables are _free variables_. From reduced echelon form, each pivot variable is expressed in terms of the free variables, yielding the general solution in _standard form_: a particular solution plus a linear combination of vectors, one per free variable.

_Uniqueness of reduced echelon form._ Any two echelon forms of the same matrix have pivots in the same positions. As a consequence, the reduced echelon form of a matrix is unique.

=== Consistency

A solution of $A bold(x) = bold(b)$ gives $bold(b)$ as a linear combination of the columns of $A$: $bold(b) = x_1 bold(a)_1 + dots.c + x_n bold(a)_n$. The system is _consistent_ if at least one solution exists, _inconsistent_ otherwise. From the echelon form $[U | bold(c)]$ of $[A | bold(b)]$: the system is inconsistent exactly when some row of $U$ is zero but the corresponding entry of $bold(c)$ is nonzero.

The _rank_ of a matrix is the number of pivots in its echelon form.

$A bold(x) = bold(b)$ is consistent if and only if $"rank"[A | bold(b)] = "rank"(A)$. In particular, if $"rank"(A) = m$, then $A bold(x) = bold(b)$ is consistent for every $bold(b) in RR^m$.

=== Existence and Uniqueness

The general solution of the inhomogeneous system $A bold(x) = bold(b)$ (when consistent) and the associated homogeneous system $A bold(x) = bold(0)$ are related: if $bold(u)_1$ is any particular solution of $A bold(x) = bold(b)$, then every solution has the form $bold(u) = bold(u)_1 + bold(v)$ where $bold(v)$ solves $A bold(x) = bold(0)$. The solution set of $A bold(x) = bold(b)$ is a translate of the solution set of $A bold(x) = bold(0)$.

A consistent system $A bold(x) = bold(b)$ has a unique solution if and only if $A bold(x) = bold(0)$ has only the trivial solution, which happens exactly when $"rank"(A) = n$.

An $n times n$ matrix is _nonsingular_ if $"rank"(A) = n$, and _singular_ if $"rank"(A) < n$.

The following are equivalent for an $n times n$ matrix $A$:

1. $A$ is nonsingular
2. $A bold(x) = bold(0)$ has only the trivial solution
3. For every $bold(b) in RR^n$, the equation $A bold(x) = bold(b)$ has a unique solution

== 4.2 Elementary Matrices and Calculating Inverse Matrices

=== Elementary Matrices

Each elementary row operation corresponds to left-multiplication by an _elementary matrix_, obtained by performing that operation on the identity:

1. Swapping rows $i$ and $j$: the matrix $E$ with rows $i, j$ of $I$ interchanged
2. Scaling row $i$ by $c != 0$: $I$ with its $(i,i)$-entry replaced by $c$
3. Adding $c$ times row $i$ to row $j$: $I$ with a $c$ in position $(j,i)$

Every elementary matrix is invertible, and its inverse is again an elementary matrix. Reducing $A$ to echelon form $U$ gives $E A = U$ where $E$ is the product of the corresponding elementary matrices.

=== Inverse Matrices

The inverse of an $n times n$ matrix $A$ is the matrix $A^(-1)$ with $A A^(-1) = A^(-1) A = I_n$. If $A$ is invertible, the unique solution of $A bold(x) = bold(b)$ is $bold(x) = A^(-1) bold(b)$.

An $n times n$ matrix is nonsingular if and only if it is invertible. To compute $A^(-1)$, row-reduce the augmented matrix $[A | I_n]$; if $A$ is nonsingular, the result is $[I_n | A^(-1)]$.

If $A$ and $B$ are $n times n$ matrices with $B A = I_n$, then $B = A^(-1)$ and $A = B^(-1)$. In particular, a one-sided inverse of a square matrix is automatically a two-sided inverse.

For a $2 times 2$ matrix: $mat(delim: "[", a, b; c, d)^(-1) = frac(1, a d - b c) mat(delim: "[", d, -b; -c, a)$, valid when $a d - b c != 0$.

=== Properties of Invertible Matrices

1. $(A B)^(-1) = B^(-1) A^(-1)$
2. $(A^T)^(-1) = (A^(-1))^T$
3. $A^T A$ is invertible when $A$ is invertible
4. Every invertible matrix is a product of elementary matrices
5. A nonsquare matrix cannot have both a left and a right inverse

== 4.3 Linear Independence, Basis, and Dimension

=== Linear Independence

The set ${bold(v)_1, dots, bold(v)_k}$ is _linearly independent_ if

$ c_1 bold(v)_1 + c_2 bold(v)_2 + dots.c + c_k bold(v)_k = bold(0) ==> c_1 = c_2 = dots.c = c_k = 0. $

Equivalently, no vector in the set can be written as a linear combination of the others. The set is _linearly dependent_ if there exists a nontrivial linear combination equaling $bold(0)$.

Linear independence is equivalent to uniqueness of representation: every $bold(v) in "Span"(bold(v)_1, dots, bold(v)_k)$ can be written uniquely as a linear combination of $bold(v)_1, dots, bold(v)_k$ if and only if the set is linearly independent.

If ${bold(v)_1, dots, bold(v)_k}$ is linearly independent, then ${bold(v)_1, dots, bold(v)_k, bold(x)}$ is linearly independent if and only if $bold(x) in.not "Span"(bold(v)_1, dots, bold(v)_k)$.

=== Basis

A set ${bold(v)_1, dots, bold(v)_k}$ is a _basis_ for a subspace $V subset RR^n$ if (i) it spans $V$, and (ii) it is linearly independent. Equivalently, every vector in $V$ can be written _uniquely_ as a linear combination of the basis vectors. Given such a representation $bold(v) = c_1 bold(v)_1 + dots.c + c_k bold(v)_k$, the scalars $c_1, dots, c_k$ are the _coordinates_ of $bold(v)$ with respect to the basis.

An $n times n$ matrix $A$ is nonsingular if and only if its column vectors form a basis for $RR^n$.

Every nontrivial subspace $V subset RR^n$ has a basis. More than $n$ vectors in $RR^n$ must be linearly dependent.

=== Dimension

Any two bases for a subspace $V$ have the same number of elements. The _dimension_ of $V$, written $dim V$, is this common number. By convention, $dim{bold(0)} = 0$.

Key dimension facts:

1. If $W subset V$ are subspaces with $dim V = dim W$, then $V = W$
2. In a $k$-dimensional subspace, any $k$ spanning vectors are linearly independent, and any $k$ linearly independent vectors span the subspace
3. Any linearly independent set in $V$ can be extended to a basis for $V$
4. $dim(U + V) = dim U + dim V - dim(U sect V)$

=== Abstract Vector Spaces

A _vector space_ is a set with addition and scalar multiplication satisfying the usual axioms. Notable examples: $cal(M)_(m times n) tilde.eq RR^(m n)$, function spaces $cal(F)(U)$, the polynomial space $cal(P)_k$ (dimension $k + 1$), and $RR^infinity$. A vector space is _finite-dimensional_ if it has a finite basis, _infinite-dimensional_ otherwise.

== 4.4 The Four Fundamental Subspaces

=== Definitions

For an $m times n$ matrix $A$ with column vectors $bold(a)_1, dots, bold(a)_n in RR^m$ and row vectors $bold(A)_1, dots, bold(A)_m in RR^n$:

- *Column space:* $bold(C)(A) = "Span"(bold(a)_1, dots, bold(a)_n) subset RR^m$. Equivalently, $bold(C)(A) = {bold(b) in RR^m : A bold(x) = bold(b) "is consistent"}$ --- the image of the linear map $bold(x) |-> A bold(x)$.

- *Row space:* $bold(R)(A) = "Span"(bold(A)_1, dots, bold(A)_m) subset RR^n$.

- *Nullspace:* $bold(N)(A) = {bold(x) in RR^n : A bold(x) = bold(0)} subset RR^n$ --- the kernel of the linear map.

- *Left nullspace:* $bold(N)(A^T) = {bold(x) in RR^m : A^T bold(x) = bold(0)} subset RR^m$.

=== Orthogonality Relations

$ bold(N)(A) = bold(R)(A)^perp, quad bold(N)(A^T) = bold(C)(A)^perp $

The nullspace and row space are orthogonal complements in $RR^n$; the left nullspace and column space are orthogonal complements in $RR^m$.

=== Computing Bases (Theorem 4.4)

Let $A$ be $m times n$ with echelon form $U$, reduced echelon form $R$, and $E A = U$.

1. *$bold(R)(A)$*: the nonzero rows of $U$ (or $R$)
2. *$bold(N)(A)$*: the standard-form vectors from the general solution of $R bold(x) = bold(0)$ (set each free variable to 1 in turn, others to 0)
3. *$bold(C)(A)$*: the _pivot columns of the original matrix_ $A$ (not of $R$)
4. *$bold(N)(A^T)$*: the rows of $E$ corresponding to zero rows of $U$ (equivalently, the constraint equations for $bold(C)(A)$)

=== Dimension Relations

For an $m times n$ matrix $A$ of rank $r$:

1. $dim bold(R)(A) = dim bold(C)(A) = r$
2. $dim bold(N)(A) = n - r$
3. $dim bold(N)(A^T) = m - r$

The _Nullity-Rank Theorem_: $"null"(A) + "rank"(A) = n$.

=== Orthogonal Complements

For any $k$-dimensional subspace $V subset RR^n$: $dim V^perp = n - k$ and $(V^perp)^perp = V$.

The four fundamental subspaces decompose their ambient spaces into orthogonal complements:

1. $bold(R)(A)^perp = bold(N)(A)$ and $bold(N)(A)^perp = bold(R)(A)$ in $RR^n$
2. $bold(C)(A)^perp = bold(N)(A^T)$ and $bold(N)(A^T)^perp = bold(C)(A)$ in $RR^m$

The linear map $bold(x) |-> A bold(x)$ restricts to a bijection $bold(R)(A) -> bold(C)(A)$. For each $bold(b) in bold(C)(A)$, there is a unique $bold(x) in bold(R)(A)$ with $A bold(x) = bold(b)$, and this $bold(x)$ is the solution of minimal length.

== 4.5 The Nonlinear Case: Introduction to Manifolds

=== Implicit Function Theorem (Simple Case)

The Implicit Function Theorem is the nonlinear analogue of solving for pivot variables in terms of free variables.

Suppose $U subset RR^n$ is open, $bold(a) in U$, $f: U -> RR$ is $cal(C)^1$, $f(bold(a)) = 0$, and $frac(diff f, diff x_n)(bold(a)) != 0$. Then there exist neighborhoods $V$ of $(a_1, dots, a_(n-1))$ and $W$ of $a_n$ and a $cal(C)^1$ function $phi: V -> W$ such that

$ f(bold(x)) = 0, quad (x_1, dots, x_(n-1)) in V, quad x_n in W quad <==> quad x_n = phi(x_1, dots, x_(n-1)). $

Near $bold(a)$, the level set $f = 0$ is a graph over the $x_1 dots.c x_(n-1)$-plane. More generally, if $D f(bold(a)) != bold(0)$, some partial derivative is nonzero, and we can solve for the corresponding variable locally.

=== Implicit Differentiation

Under the hypotheses of the Implicit Function Theorem, the partial derivatives of $phi$ are given by

$ frac(diff phi, diff x_j)(overline(bold(a))) = - frac(frac(diff f, diff x_j)(bold(a)), frac(diff f, diff x_n)(bold(a))) $

for $j = 1, dots, n - 1$, where $overline(bold(a)) = (a_1, dots, a_(n-1))$. This is derived by differentiating the identity $f(overline(bold(x)), phi(overline(bold(x)))) = 0$ via the chain rule.

=== Tangent Hyperplanes

If $f: U -> RR$ is $cal(C)^1$, $D f(bold(a)) != bold(0)$, and $f(bold(a)) = c$, then the tangent hyperplane to the level set $M = f^(-1)({c})$ at $bold(a)$ is

$ T_(bold(a)) M = {bold(x) in RR^n : D f(bold(a))(bold(x) - bold(a)) = 0} $

That is, $nabla f(bold(a))$ is normal to $M$ at $bold(a)$.

=== Manifolds

A subset $M subset RR^n$ is an $(n - m)$-dimensional _manifold_ if each point has a neighborhood that is a $cal(C)^1$ graph over some $(n - m)$-dimensional coordinate plane.

If $bold(F): RR^n -> RR^m$ is $cal(C)^1$ and $"rank"(D bold(F)(bold(x))) = m$ at every point $bold(x)$ of the level set $M = bold(F)^(-1)({bold(0)})$, then $M$ is an $(n - m)$-dimensional manifold. The tangent plane at $bold(a) in M$ is $T_(bold(a)) M = bold(a) + bold(N)(D bold(F)(bold(a)))$, the translate of the nullspace of the derivative.

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 5: Extremum Problems

== 5.1 Compactness and the Maximum Value Theorem

=== Compactness

A set $S subset RR^n$ is _bounded_ if there exists $M$ so that $norm(bold(x)) <= M$ for all $bold(x) in S$. A set $S subset RR^n$ is _compact_ if it is both closed and bounded. Compact sets are the multivariable analogue of closed intervals --- they are precisely the sets on which continuous functions are guaranteed to achieve their extreme values.

Every sequence of points in a compact set $A subset RR^n$ has a convergent subsequence whose limit lies in $A$.

=== Maximum Value Theorem

If $X subset RR^n$ is compact and $f: X -> RR$ is continuous, then $f$ attains its maximum and minimum values. That is, there exist $bold(y), bold(z) in X$ so that

$ f(bold(y)) <= f(bold(x)) <= f(bold(z)) quad "for all" bold(x) in X. $

=== Operator Norm

The norm (operator norm) of a linear map $T: RR^n -> RR^m$ is defined as

$ norm(T) = max_(norm(bold(x)) = 1) norm(T(bold(x))). $

This maximum exists by the Maximum Value Theorem applied to the compact unit sphere $S^(n-1)$.

1. $norm(T(bold(x))) <= norm(T) norm(bold(x))$ for all $bold(x) in RR^n$
2. $norm(c T) = abs(c) norm(T)$
3. $norm(S + T) <= norm(S) + norm(T)$
4. $norm(S compose T) <= norm(S) norm(T)$
5. If $A$ is diagonal with entries $d_1, dots, d_n$, then $norm(A) = max(abs(d_1), dots, abs(d_n))$

=== Uniform Continuity Theorem

If $X subset RR^n$ is compact and $f: X -> RR$ is continuous, then $f$ is uniformly continuous: given $epsilon > 0$, there exists $delta > 0$ so that $abs(f(bold(x)) - f(bold(y))) < epsilon$ whenever $norm(bold(x) - bold(y)) < delta$ with $bold(x), bold(y) in X$.

== 5.2 Maximum/Minimum Problems

=== Definitions

Let $X subset RR^n$ and $bold(a) in X$. The function $f: X -> RR$ has a _global maximum_ at $bold(a)$ if $f(bold(x)) <= f(bold(a))$ for all $bold(x) in X$, and a _local maximum_ at $bold(a)$ if $f(bold(x)) <= f(bold(a))$ for all $bold(x) in B(bold(a), delta) sect X$ for some $delta > 0$. Analogous definitions hold for _global minimum_ and _local minimum_. An _extremum_ is either a local max or local min.

=== Critical Points

If $bold(a)$ is an extremum of $f$ and $f$ is differentiable at $bold(a)$, then $D f(bold(a)) = bold(0)$ (equivalently, $nabla f(bold(a)) = bold(0)$). Geometrically, the tangent plane to the graph at an extremum must be horizontal --- all directional derivatives vanish.

A point $bold(a)$ where $D f(bold(a)) = bold(0)$ is called a _critical point_. A critical point where $f$ takes both larger and smaller values nearby is a _saddle point_.

=== Strategy for Compact Domains

On a compact region $X$: the Maximum Value Theorem guarantees global extrema exist. Find all critical points in the interior of $X$, then examine $f$ on the boundary of $X$. Compare all values to determine global max and min.

On non-compact domains: one must argue separately that a global extremum exists, typically by showing $f(bold(x)) -> infinity$ as $bold(x)$ approaches the boundary or infinity, and then trapping the minimum inside a compact subset.

== 5.3 Quadratic Forms and the Second Derivative Test

=== Taylor Expansion with Remainder

The Hessian matrix of a $cal(C)^2$ function $f$ at $bold(a)$ is the symmetric matrix

$ "Hess"(f)(bold(a)) = [frac(diff^2 f, diff x_i diff x_j)(bold(a))]_(i j). $

The associated quadratic form $cal(H)_(f, bold(a)): RR^n -> RR$ is defined by $cal(H)_(f, bold(a))(bold(h)) = bold(h)^top "Hess"(f)(bold(a)) bold(h)$. If $f: B(bold(a), r) -> RR$ is $cal(C)^2$, then for all $bold(h)$ with $norm(bold(h)) < r$,

$ f(bold(a) + bold(h)) = f(bold(a)) + D f(bold(a)) bold(h) + 1/2 cal(H)_(f, bold(a) + xi bold(h))(bold(h)) quad "for some" 0 < xi < 1. $

Consequently,

$ f(bold(a) + bold(h)) = f(bold(a)) + D f(bold(a)) bold(h) + 1/2 cal(H)_(f, bold(a))(bold(h)) + epsilon(bold(h)), $

where $epsilon(bold(h)) / norm(bold(h))^2 -> 0$ as $bold(h) -> bold(0)$. At a critical point ($D f(bold(a)) = bold(0)$), the linear term vanishes and the Hessian quadratic form controls the local behavior of $f$.

=== Classifying Quadratic Forms

Given a symmetric $n times n$ matrix $A$, the quadratic form $cal(Q)(bold(x)) = bold(x)^top A bold(x)$ is

- _positive definite_ if $cal(Q)(bold(x)) > 0$ for all $bold(x) != bold(0)$
- _negative definite_ if $cal(Q)(bold(x)) < 0$ for all $bold(x) != bold(0)$
- _positive semidefinite_ if $cal(Q)(bold(x)) >= 0$ for all $bold(x)$ and $= 0$ for some $bold(x) != bold(0)$
- _negative semidefinite_ if $cal(Q)(bold(x)) <= 0$ for all $bold(x)$ and $= 0$ for some $bold(x) != bold(0)$
- _indefinite_ if $cal(Q)$ takes both positive and negative values

=== Second Derivative Test

If $f$ is $cal(C)^2$ near a critical point $bold(a)$:

1. $cal(H)_(f, bold(a))$ positive definite $==>$ $bold(a)$ is a local minimum
2. $cal(H)_(f, bold(a))$ negative definite $==>$ $bold(a)$ is a local maximum
3. $cal(H)_(f, bold(a))$ indefinite $==>$ $bold(a)$ is a saddle point
4. $cal(H)_(f, bold(a))$ semidefinite $==>$ inconclusive

=== Two-Variable Test

When $n = 2$, write $"Hess"(f)(bold(a)) = mat(delim: "[", A, B; B, C)$. Then

1. $A C - B^2 > 0$ and $A > 0$ $==>$ local minimum
2. $A C - B^2 > 0$ and $A < 0$ $==>$ local maximum
3. $A C - B^2 < 0$ $==>$ saddle point
4. $A C - B^2 = 0$ $==>$ inconclusive

The quantity $A C - B^2 = det("Hess"(f)(bold(a)))$.

=== $L D L^top$ Decomposition

Completing the square in a quadratic form corresponds to factoring the symmetric matrix as $A = L D L^top$, where $L$ is lower triangular with 1's on the diagonal and $D$ is diagonal. The signs of the diagonal entries of $D$ determine the definiteness of $cal(Q)$:

1. All $d_i > 0$ $==>$ positive definite
2. All $d_i < 0$ $==>$ negative definite
3. All $d_i >= 0$ with at least one $d_i = 0$ $==>$ positive semidefinite
4. All $d_i <= 0$ with at least one $d_i = 0$ $==>$ negative semidefinite
5. $d_i$ of mixed sign $==>$ indefinite

The key identity is $cal(Q)(bold(x)) = bold(x)^top L D L^top bold(x) = sum_(i=1)^n d_i y_i^2$ where $bold(y) = L^top bold(x)$.

== 5.4 Lagrange Multipliers

=== Constrained Extrema

The method of Lagrange multipliers handles optimization of a function subject to constraints. The geometric idea: at a constrained extremum, the level set of $f$ must be tangent to the constraint surface, so their normal vectors are parallel.

Let $U subset RR^n$ be open, $f: U -> RR$ differentiable, and $bold(g): U -> RR^m$ be $cal(C)^1$ with $bold(g)(bold(a)) = bold(0)$. Suppose $"rank"(D bold(g)(bold(a))) = m$. If $bold(a)$ is a local extremum of $f$ subject to the constraint $bold(g) = bold(0)$, then there exist scalars $lambda_1, dots, lambda_m$ (the _Lagrange multipliers_) so that

$ D f(bold(a)) = lambda_1 D g_1(bold(a)) + dots.c + lambda_m D g_m(bold(a)). $

Equivalently, $nabla f(bold(a))$ is a linear combination of $nabla g_1(bold(a)), dots, nabla g_m(bold(a))$.

This is a necessary condition, not sufficient --- constrained saddle points can also satisfy these equations.

=== Procedure

To optimize $f$ subject to $m$ constraints $g_1 = dots.c = g_m = 0$ in $n$ variables ($n > m$):

1. Solve the system of $n + m$ equations in $n + m$ unknowns: $D f = lambda_1 D g_1 + dots.c + lambda_m D g_m$ together with $g_1 = dots.c = g_m = 0$.
2. Evaluate $f$ at all constrained critical points and compare.
3. If the constraint surface is compact, the Maximum Value Theorem guarantees global extrema among the critical points.

=== Eigenvalues via Lagrange Multipliers

Optimizing $cal(Q)(bold(x)) = bold(x)^top A bold(x)$ subject to $norm(bold(x))^2 = 1$ for a symmetric matrix $A$ yields the condition $A bold(x) = lambda bold(x)$. Solutions are _eigenvectors_ of $A$ and the multipliers $lambda$ are the _eigenvalues_. By compactness of $S^(n-1)$, every symmetric matrix has at least two eigenvalues (a max and a min of $cal(Q)$ on the sphere).

=== Constrained Second Derivative Test

At a constrained critical point $bold(a)$ with $D f(bold(a)) = lambda D g(bold(a))$ and $D g(bold(a)) != bold(0)$: $bold(a)$ is a constrained local max (resp. min) if the Hessian of $f - lambda g$ restricted to the tangent space $T_(bold(a)) M$ is negative (resp. positive) definite.

== 5.5 Projections, Least Squares, and Inner Product Spaces

=== Projection onto a Subspace

The _projection_ of $bold(b) in RR^n$ onto a subspace $V subset RR^n$ is the unique $bold(p) in V$ such that $bold(b) - bold(p) in V^perp$. We write $bold(p) = "proj"_V bold(b)$.

If $A$ is the $n times m$ matrix whose columns form a basis for $V$ (with $"rank"(A) = m$), then the projection is $bold(p) = P bold(b)$ where the projection matrix is

$ P = A(A^top A)^(-1) A^top. $

Properties of $P$:

1. $P^top = P$ (symmetric)
2. $P^2 = P$ (idempotent)
3. $I - P$ is the projection matrix onto $V^perp$

=== Least Squares

Given an inconsistent system $A bold(x) = bold(b)$ where $A$ is $n times m$ with $"rank"(A) = m$, the _least squares solution_ $overline(bold(x))$ minimizes $norm(A bold(x) - bold(b))^2$. It is the unique solution to the _normal equations_

$ (A^top A) overline(bold(x)) = A^top bold(b). $

The projection of $bold(b)$ onto $bold(C)(A)$ is then $bold(p) = A overline(bold(x))$.

When $V = bold(N)(B)$ is given implicitly, projection via Lagrange multipliers gives

$ "proj"_(bold(N)(B)) bold(b) = bold(b) - B^top (B B^top)^(-1) B bold(b) = (I - B^top (B B^top)^(-1) B) bold(b). $

=== Data Fitting

To find the least squares line $y = a x + b$ through data points $(x_1, y_1), dots, (x_m, y_m)$: solve the normal equations for the system $A mat(delim: "[", a; b) = bold(y)$ where $A = mat(delim: "[", x_1, 1; dots.v, dots.v; x_m, 1)$. The error vector $bold(epsilon) = bold(y) - A overline(bold(x))$ always satisfies $epsilon_1 + dots.c + epsilon_m = 0$ --- the algebraic sum of the errors vanishes.

=== Orthogonal Bases

A set ${bold(v)_1, dots, bold(v)_k}$ is an _orthogonal set_ if $bold(v)_i dot bold(v)_j = 0$ for $i != j$. An _orthogonal basis_ for a subspace $V$ is a basis that is also an orthogonal set. An _orthonormal basis_ additionally has $norm(bold(v)_i) = 1$ for each $i$.

The key property: ${bold(v)_1, dots, bold(v)_k}$ is an orthogonal basis for $V$ if and only if every $bold(x) in V$ satisfies

$ bold(x) = sum_(i=1)^k frac(bold(x) dot bold(v)_i, norm(bold(v)_i)^2) bold(v)_i. $

For any $bold(b) in RR^n$, projection onto $V$ with an orthogonal basis is

$ "proj"_V bold(b) = sum_(i=1)^k frac(bold(b) dot bold(v)_i, norm(bold(v)_i)^2) bold(v)_i. $

This is equivalent to the matrix formula $P = sum_(i=1)^k frac(1, norm(bold(v)_i)^2) bold(v)_i bold(v)_i^top$.

=== Gram-Schmidt Process

Given a basis ${bold(v)_1, dots, bold(v)_k}$ for $V$, the Gram-Schmidt process produces an orthogonal basis ${bold(w)_1, dots, bold(w)_k}$ by iteratively subtracting projections:

$ bold(w)_1 &= bold(v)_1 \
bold(w)_(j+1) &= bold(v)_(j+1) - sum_(i=1)^j frac(bold(v)_(j+1) dot bold(w)_i, norm(bold(w)_i)^2) bold(w)_i. $

Each $bold(w)_(j+1)$ is the component of $bold(v)_(j+1)$ orthogonal to $"Span"(bold(w)_1, dots, bold(w)_j)$. Normalizing gives an orthonormal basis: $bold(q)_i = bold(w)_i / norm(bold(w)_i)$.

=== Inner Product Spaces

A real vector space $V$ is an _inner product space_ if there is a pairing $chevron.l bold(u), bold(v) chevron.r in RR$ satisfying:

1. $chevron.l bold(v), bold(u) chevron.r = chevron.l bold(u), bold(v) chevron.r$ (symmetry)
2. $chevron.l c bold(u), bold(v) chevron.r = c chevron.l bold(u), bold(v) chevron.r$ (linearity in first argument)
3. $chevron.l bold(u) + bold(v), bold(w) chevron.r = chevron.l bold(u), bold(w) chevron.r + chevron.l bold(v), bold(w) chevron.r$ (additivity)
4. $chevron.l bold(v), bold(v) chevron.r >= 0$ with equality iff $bold(v) = bold(0)$ (positive definiteness)

Length, orthogonality, Cauchy-Schwarz, projections, and Gram-Schmidt all generalize to inner product spaces. Two important instances: $cal(C)^0([a, b])$ with $chevron.l f, g chevron.r = integral_a^b f(t) g(t) dif t$, and $cal(M)_(n times n)$ with $chevron.l A, B chevron.r = "tr"(A^top B)$.

=== Lagrange Interpolation

Given $k + 1$ points $(t_1, b_1), dots, (t_(k+1), b_(k+1))$ with distinct $t_i$, there exists a unique polynomial $p in cal(P)_k$ passing through them. The Lagrange basis polynomials are

$ p_i(t) = product_(j != i) frac(t - t_j, t_i - t_j), $

satisfying $p_i(t_j) = cases(1 &"if" i = j, 0 &"if" i != j)$, and the interpolating polynomial is $p = b_1 p_1 + dots.c + b_(k+1) p_(k+1)$.

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

== 8.5 Stokes's Theorem

=== Manifolds with Boundary

A subset $M subset RR^n$ is a $k$-dimensional _manifold with boundary_ if for each $bold(p) in M$ there is an open set $W subset RR^n$ containing $bold(p)$ and a parameterization $bold(g): U -> RR^n$ with $bold(g)(U) = W sect M$, where $U$ is an open subset either of $RR^k$ or of $RR^k_+ = {bold(u) in RR^k : u_k >= 0}$. A point $bold(p) = bold(g)(bold(u))$ is a _boundary point_ ($bold(p) in diff M$) if $bold(u) in diff RR^k_+ = {bold(u) in RR^k : u_k = 0}$.

An _orientation_ on $M$ is a continuously varying notion of positively oriented basis for each tangent space. $M$ is orientable iff we can cover it by coordinate charts $bold(g)$ so that ${frac(diff bold(g), diff u_1), dots, frac(diff bold(g), diff u_k)}$ is always a positive basis, equivalently iff there is a nowhere-vanishing $k$-form on $M$. The oriented _volume form_ $sigma$ assigns to each $k$-tuple of tangent vectors the signed volume of the parallelepiped they span.

=== Partition of Unity

To define integration on a manifold that requires multiple coordinate charts, we use a partition of unity. If $M subset RR^n$ is a compact $k$-dimensional manifold with boundary, then there exist smooth functions $rho_1, dots, rho_N$ on $M$ such that

1. $0 <= rho_i <= 1$ for all $i$
2. Each $rho_i$ is zero outside some coordinate ball
3. $sum_(i=1)^N rho_i = 1$

The construction uses bump functions: $psi(bold(x)) = j(3 - 2 norm(bold(x)))$ where $j$ is built from the smooth function $h(x) = cases(e^(-1 slash x) & x > 0, 0 & x <= 0)$. This $psi$ equals 1 on $norm(bold(x)) <= 1$ and 0 on $norm(bold(x)) >= 3 slash 2$.

With a partition of unity, we define $integral_M omega = sum_(i=1)^N integral_(B(bold(0), 2)) bold(g)_i^* (rho_i omega)$, where the $bold(g)_i$ are orientation-preserving parameterizations.

=== Boundary Orientation

The boundary $diff M$ inherits an orientation from $M$: the outward-pointing normal $bold(n)$ followed by a positively oriented basis for $T_(bold(p)) diff M$ should be a positively oriented basis for $T_(bold(p)) M$. The boundary orientation on $diff RR^k_+$ is $(-1)^k$ times the usual orientation on $RR^(k-1)$.

=== Stokes's Theorem

The crowning result of the chapter, generalizing the Fundamental Theorem of Calculus, the FTC for line integrals, and Green's Theorem.

If $M$ is a compact, oriented $k$-dimensional manifold with boundary, and $omega$ is a smooth $(k-1)$-form on $M$, then

$ integral_(diff M) omega = integral_M dif omega $

where $diff M$ carries the boundary orientation.

*Immediate consequences:*

1. The classical FTC is the case $k = 1$: $integral_a^b f'(t) dif t = f(b) - f(a)$
2. The FTC for line integrals (Proposition 8.3) is the case of a 0-form on a curve
3. Green's Theorem (Corollary 8.3) is the case $k = 2$ in $RR^2$
4. If $M$ is a compact oriented manifold _without_ boundary, then $integral_M dif eta = 0$ for any $(k-1)$-form $eta$ (i.e. exact forms integrate to zero on closed manifolds)

=== Key Example: the Solid Angle Form

The 2-form on $RR^3 - {bold(0)}$ given by

$ omega = frac(x dif y and.big dif z + y dif z and.big dif x + z dif x and.big dif y, (x^2 + y^2 + z^2)^(3 slash 2)) $

satisfies $dif omega = 0$ (it is closed) and on any sphere of radius $a$ centered at the origin, $omega$ equals $1 slash a^2$ times the area 2-form. Its integral over any sphere centered at the origin (with outward normal) is $4 pi$. For any compact 3-manifold with boundary $Omega subset RR^3$ with $bold(0) in.not diff Omega$,

$ integral_(diff Omega) omega = cases(4 pi & bold(0) in Omega, 0 & bold(0) in.not Omega) $

This is the 3-dimensional analogue of the winding number. The case $bold(0) in.not Omega$ follows directly from Stokes since $dif omega = 0$. The case $bold(0) in Omega$ is proved by excising a small ball around the origin and applying Stokes to the resulting region.

== 8.6 Applications to Physics

=== The Dictionary in $RR^3$

Differential forms and classical vector calculus operations correspond as follows. Given a vector field $bold(F) = mat(delim: "[", F_1; F_2; F_3)$ in $RR^3$:

*Gradient ($dif$ on 0-forms):* For a function $f$, the 1-form $dif f = sum frac(diff f, diff x_i) dif x_i$ corresponds to the vector field $nabla f$.

*Curl ($dif$ on 1-forms):* Given $omega = F_1 dif x_1 + F_2 dif x_2 + F_3 dif x_3$,

$ dif omega = lr((frac(diff F_3, diff x_2) - frac(diff F_2, diff x_3))) dif x_2 and.big dif x_3 + lr((frac(diff F_1, diff x_3) - frac(diff F_3, diff x_1))) dif x_3 and.big dif x_1 + lr((frac(diff F_2, diff x_1) - frac(diff F_1, diff x_2))) dif x_1 and.big dif x_2 $

This is the 2-form corresponding to $"curl" bold(F) = nabla times bold(F)$.

*Divergence ($dif$ on 2-forms):* Given $omega = F_1 dif x_2 and.big dif x_3 + F_2 dif x_3 and.big dif x_1 + F_3 dif x_1 and.big dif x_2$,

$ dif omega = lr((frac(diff F_1, diff x_1) + frac(diff F_2, diff x_2) + frac(diff F_3, diff x_3))) dif x_1 and.big dif x_2 and.big dif x_3 $

This is the 3-form corresponding to $"div" bold(F) = nabla dot bold(F)$.

*Summary table:*

1. $dif$ on 0-forms $<-->$ gradient ($nabla f$)
2. $dif$ on 1-forms $<-->$ curl ($nabla times bold(F)$)
3. $dif$ on 2-forms $<-->$ divergence ($nabla dot bold(F)$)

The identity $dif^2 = 0$ translates to both $"curl"(nabla f) = bold(0)$ and $"div"("curl" bold(F)) = 0$.

=== Classical Stokes's Theorem

If $S subset RR^3$ is a compact, oriented surface with boundary, and $bold(F)$ is a smooth vector field on $S$, then

$ integral_(diff S) bold(F) dot bold(T) dif s = integral_S "curl" bold(F) dot bold(n) dif S $

The left side is the circulation of $bold(F)$ around $diff S$; the right is the flux of $"curl" bold(F)$ through $S$. Physically, $"curl" bold(F)(bold(a)) dot bold(n) = lim_(r -> 0^+) frac(1, pi r^2) integral_(diff D_r) bold(F) dot bold(T) dif s$ measures the tendency of a small paddlewheel at $bold(a)$ to spin: it spins fastest when the axle points in the direction of $"curl" bold(F)$.

=== Classical Divergence Theorem (Gauss's Theorem)

If $bold(F)$ is a smooth vector field on a compact 3-manifold with boundary $Omega subset RR^3$, then

$ integral_(diff Omega) bold(F) dot bold(n) dif S = integral_Omega "div" bold(F) dif V $

The divergence has a limiting interpretation: $"div" bold(F)(bold(a)) = lim_(r -> 0^+) frac(1, frac(4, 3) pi r^3) integral_(diff overline(B)(bold(a), r)) bold(F) dot bold(n) dif S$. Positive divergence means $bold(a)$ is a _source_ (net outward flux); negative means a _sink_.

=== Gauss's Law

The gravitational field of a mass $M$ at the origin is $bold(F) = -G M frac(bold(x), norm(bold(x))^3)$. This field satisfies $"div" bold(F) = 0$ away from the origin. For any compact surface $S = diff Omega$ (with $bold(0) in.not S$),

$ integral_S bold(F) dot bold(n) dif S = cases(-4 pi G M & bold(0) in Omega, 0 & "otherwise") $

More generally, for a continuous mass distribution with density $delta$,

$ integral_S bold(F) dot bold(n) dif S = -4 pi G integral_Omega delta dif V = -4 pi G M $

where $M$ is the total mass inside $S$. This defines $"div" bold(F)(bold(x)) = -4 pi G delta(bold(x))$.

An application: the gravitational field _inside_ a uniform ball of mass $M$ and radius $R$ is $bold(F)(bold(x)) = -frac(G M, R^3) bold(x)$, which is linear in $norm(bold(x))$. A frictionless tunnel through such a ball produces simple harmonic motion with travel time $T = pi sqrt(R slash g) approx 42$ minutes, independent of the tunnel's orientation.

=== Maxwell's Equations

Let $bold(E)$ be the electric field, $bold(B)$ the magnetic field, $rho$ the charge density, and $bold(J)$ the current density, all on $RR^3 times RR$ (space-time). Maxwell's equations (ignoring constants) are:

1. Gauss's law: $"div" bold(E) = rho$
2. No magnetic monopoles: $"div" bold(B) = 0$
3. Faraday's law: $"curl" bold(E) = -frac(diff bold(B), diff t)$
4. Ampere's law: $"curl" bold(B) = frac(diff bold(E), diff t) + bold(J)$

These can be encoded as two differential forms on $RR^4$. Defining

$ omega = (E_1 dif x + E_2 dif y + E_3 dif z) and.big dif t + (B_1 dif y and.big dif z + B_2 dif z and.big dif x + B_3 dif x and.big dif y) $

we have $dif omega = 0$ iff $"div" bold(B) = 0$ and $"curl" bold(E) + frac(diff bold(B), diff t) = bold(0)$ (Faraday + no monopoles).

Defining $theta = ast.op omega$ (the Hodge star in Lorentz metric), Gauss's law and Ampere's law are encoded by $dif theta$ being a specific 3-form involving $bold(J)$ and $rho$ (or $dif theta = 0$ in vacuum).

Since $dif omega = 0$ on $RR^4$, there exists a 1-form $alpha$ with $dif alpha = omega$ (a _potential_). After a gauge transformation (adding $dif f$ for an appropriate $f$), solving Maxwell's equations reduces to solving the inhomogeneous wave equations $nabla^2 bold(A) - frac(diff^2 bold(A), diff t^2) = -bold(J)$ and $nabla^2 phi - frac(diff^2 phi, diff t^2) = -rho$.

== 8.7 Applications to Topology

=== The Fundamental Lemma

The key ingredient: there exists an $n$-form $omega$ on the unit sphere $S^n = {bold(x) in RR^(n+1) : norm(bold(x)) = 1}$ with nonzero integral. Explicitly, the volume form

$ omega = sum_(i=1)^(n+1) (-1)^(i-1) x_i dif x_1 and.big dots.c and.big hat(dif x_i) and.big dots.c and.big dif x_(n+1) $

works (where $hat(dif x_i)$ means $dif x_i$ is omitted).

=== No Retraction Theorem

Let $D^(n+1) = {bold(x) in RR^(n+1) : norm(bold(x)) <= 1}$ be the closed unit ball. There is no smooth function $bold(r): D^(n+1) -> S^n$ with $bold(r)(bold(x)) = bold(x)$ for all $bold(x) in S^n$.

The proof is a clean application of Stokes and pullback: if such $bold(r)$ existed, then $integral_(S^n) omega = integral_(S^n) bold(r)^* omega = integral_(D^(n+1)) dif(bold(r)^* omega) = integral_(D^(n+1)) bold(r)^*(dif omega) = 0$, since any $(n+1)$-form on an $n$-dimensional manifold is 0. This contradicts $integral_(S^n) omega != 0$.

=== Brouwer Fixed Point Theorem

Every smooth map $bold(f): D^n -> D^n$ has a fixed point $bold(f)(bold(x)) = bold(x)$.

If not, the ray from $bold(f)(bold(x))$ through $bold(x)$ hits $S^(n-1)$, defining a smooth retraction $bold(r): D^n -> S^(n-1)$ with $bold(r)(bold(x)) = bold(x)$ on $S^(n-1)$, contradicting the No Retraction Theorem.

=== Homotopy

Two smooth maps $bold(f), bold(g): X -> Y$ are _homotopic_ if there is a smooth map $bold(H): X times [0, 1] -> Y$ with $bold(H)(bold(x), 0) = bold(f)(bold(x))$ and $bold(H)(bold(x), 1) = bold(g)(bold(x))$ for all $bold(x) in X$. Intuitively, $bold(H)$ continuously deforms $bold(f)$ into $bold(g)$.

*Homotopy invariance of integrals:* If $X$ is a compact, oriented $k$-dimensional manifold and $bold(f), bold(g): X -> Y$ are homotopic, then for any closed $k$-form $omega$ on $Y$,

$ integral_X bold(f)^* omega = integral_X bold(g)^* omega $

The proof uses Stokes's Theorem on the cylinder $X times [0, 1]$: $integral_(diff(X times [0, 1])) bold(H)^* omega = integral_(X times [0, 1]) bold(H)^*(dif omega) = 0$ since $dif omega = 0$, and the boundary decomposes as $(X times {1})^- union (X times {0})$.

*Application:* the maps $bold(f), bold(g): S^1 -> S^1$ given by $bold(f)(cos t, sin t) = (cos t, sin t)$ and $bold(g)(cos t, sin t) = (cos 2t, sin 2t)$ are _not_ homotopic, since $integral_(S^1) bold(f)^* omega = 2 pi$ but $integral_(S^1) bold(g)^* omega = 4 pi$ for $omega = -y dif x + x dif y$.

=== Simply Connected (Revisited)

$X subset RR^n$ is _simply connected_ if every pair of points can be joined by a path and every map $bold(f): S^1 -> X$ is homotopic to a constant map.

By homotopy invariance, on a simply connected manifold $X$, every closed 1-form is exact: if $bold(f): S^1 -> X$ is any closed curve, then $bold(f)$ is homotopic to a constant $bold(g)$, so $integral_(S^1) bold(f)^* omega = integral_(S^1) bold(g)^* omega = 0$. This globalizes the local result from Section 8.3.

=== Fundamental Theorem of Algebra

Every nonconstant polynomial $p(z) = z^n + a_(n-1) z^(n-1) + dots.c + a_0$ with $a_i in CC$ has a root in $CC$.

The proof uses homotopy and winding numbers. For large $R$, $p$ is homotopic to $g(z) = z^n$ on $diff overline(B)(bold(0), R)$ via $bold(H)(z, t) = z^n + (1-t)(a_(n-1) z^(n-1) + dots.c + a_0)$. Since $integral_(diff overline(B)(bold(0), R)) bold(g)^* omega = 2 pi n != 0$ (where $omega = frac(-y dif x + x dif y, x^2 + y^2)$), homotopy invariance gives $integral_(diff overline(B)(bold(0), R)) p^* omega = 2 pi n$. If $p$ had no root in $B(bold(0), R)$, then $p$ maps $overline(B)(bold(0), R) -> CC - {0}$, and Stokes would give the integral is 0, a contradiction.

=== Counting Roots via Winding Numbers

The pullback formula for products gives: if $f, g$ are smooth maps to $CC - {0}$ and $omega = frac(-y dif x + x dif y, x^2 + y^2)$, then $(f g)^* omega = f^* omega + g^* omega$.

Using this, if $p(z) = c(z - r_1) dots.c (z - r_n)$ and $C = diff D$ avoids all roots, then

$ frac(1, 2 pi) integral_C p^* omega = "number of roots of" p "in" D $

This is a 2-dimensional analogue of Gauss's law: each root contributes winding number 1.

=== Hairy Ball Theorem

Any vector field on $S^(2m)$ (an even-dimensional sphere) must vanish somewhere. A _vector field_ on $S^n$ is a smooth $bold(v): S^n -> RR^(n+1)$ with $bold(x) dot bold(v)(bold(x)) = 0$ (tangency).

In contrast, odd-dimensional spheres always admit nowhere-zero vector fields: on $S^(2m-1) subset RR^(2m)$, the field $bold(v)(x_1, x_2, dots, x_(2m-1), x_(2m)) = (-x_2, x_1, dots, -x_(2m), x_(2m-1))$ works.

For the even case: suppose $bold(v)$ were a nowhere-zero unit vector field on $S^(2m)$. Define a homotopy from the identity to the antipodal map by $bold(H)(bold(x), t) = (cos pi t) bold(x) + (sin pi t) bold(v)(bold(x))$, following semicircles from $bold(x)$ to $-bold(x)$ in the direction of $bold(v)$. But the antipodal map on $S^(2m)$ satisfies $bold(g)^* omega = (-1)^(2m+1) omega = -omega$, so homotopy invariance gives $integral_(S^(2m)) omega = -integral_(S^(2m)) omega$, contradicting $integral_(S^(2m)) omega != 0$.

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

= Chapter 9: Eigenvalues, Eigenvectors, and Applications

The central question: given a linear transformation $T: RR^n -> RR^n$, can we choose coordinates so that the matrix for $T$ is as simple as possible -- ideally diagonal? The tool for this is eigenvalues and eigenvectors.

== 9.1 Linear Transformations and Change of Basis

=== Matrix for $T$ with Respect to a Basis

Let $V$ be a finite-dimensional vector space, $T: V -> V$ a linear transformation, and $cal(B) = {bold(v)_1, dots, bold(v)_n}$ an ordered basis for $V$. Define $a_(i j)$ by $T(bold(v)_j) = sum_(i=1)^n a_(i j) bold(v)_i$. Then $A = [a_(i j)]$ is the _matrix for $T$ with respect to $cal(B)$_, denoted $[T]_cal(B)$. The columns of $A$ are the coordinate vectors of $T(bold(v)_1), dots, T(bold(v)_n)$ with respect to $cal(B)$.

=== Change of Basis

Suppose $T: V -> V$ is a linear transformation with two ordered bases $cal(B) = {bold(v)_1, dots, bold(v)_n}$ and $cal(B)' = {bold(v)'_1, dots, bold(v)'_n}$ for $V$. The _change-of-basis matrix_ $P$ has columns given by the coordinates of the new basis vectors with respect to the old basis. When $cal(B)$ is the standard basis, $P = mat(delim: "[", mid, mid, , mid; bold(v)'_1, bold(v)'_2, dots.c, bold(v)'_n; mid, mid, , mid)$.

The change-of-basis formula relates the matrices for $T$ in the two bases:

$ [T]_(cal(B)') = P^(-1) [T]_cal(B) P $

Two matrices $A$ and $B$ are _similar_ if $B = P^(-1) A P$ for some invertible $P$. Any two matrices representing the same linear map $T: V -> V$ are similar.

=== Properties of Similarity

1. Similar matrices have the same characteristic polynomial, eigenvalues, determinant, trace, and rank
2. If $B = P^(-1) A P$, then $B^k = P^(-1) A^k P$ for all $k in NN$
3. Similarity is an equivalence relation: reflexive, symmetric, and transitive

== 9.2 Eigenvalues, Eigenvectors, and Diagonalizability

=== Eigenvalues and Eigenvectors

An eigenvector of a linear transformation is a nonzero vector whose direction is unchanged by $T$ -- it is only scaled.

Let $T: V -> V$ be a linear transformation. A _nonzero_ vector $bold(v) in V$ is an _eigenvector_ of $T$ if there is a scalar $lambda$ so that $T(bold(v)) = lambda bold(v)$. The scalar $lambda$ is the associated _eigenvalue_.

$T$ is _diagonalizable_ if and only if there is a basis for $V$ consisting of eigenvectors of $T$.

=== The Eigenspace

For any scalar $lambda$, the set $bb(E)(lambda) = {bold(v) in V : T(bold(v)) = lambda bold(v)} = ker(T - lambda I)$ is a subspace of $V$. When $dim bb(E)(lambda) > 0$, we call $lambda$ an eigenvalue and $bb(E)(lambda)$ the $lambda$-_eigenspace_.

=== The Characteristic Polynomial

The characteristic polynomial of an $n times n$ matrix $A$ is $p(t) = det(A - t I)$. The eigenvalues of $A$ are the real roots of $p(t)$. Once we know an eigenvalue $lambda$, we find eigenvectors by computing $N(A - lambda I)$.

Similar matrices have the same characteristic polynomial, so the characteristic polynomial of a linear map $T: V -> V$ is well-defined (independent of basis).

=== Shortcuts for the Characteristic Polynomial

For $2 times 2$: $p(t) = t^2 - ("tr" A) t + det A$

For $3 times 3$: $p(t) = -t^3 + ("tr" A) t^2 - (C_(11) + C_(22) + C_(33)) t + det A$, where $C_(i i)$ is the $i i$th cofactor.

In general: $p(t) = (-1)^n t^n + (-1)^(n-1) ("tr" A) t^(n-1) + dots.c + det A$.

The rational roots test is useful: if $p(t)$ has integer coefficients and leading coefficient $plus.minus 1$, then any rational root must be an integer dividing the constant term $det A$.

=== Diagonalizability

Eigenvectors corresponding to distinct eigenvalues are always linearly independent. In particular, if an $n times n$ matrix has $n$ distinct real eigenvalues, it is diagonalizable.

When eigenvalues are repeated, diagonalizability depends on the relationship between algebraic and geometric multiplicity.

The _algebraic multiplicity_ of an eigenvalue $lambda$ is its multiplicity as a root of $p(t)$, i.e. the highest power of $(t - lambda)$ dividing $p(t)$. The _geometric multiplicity_ is $dim bb(E)(lambda) = dim N(A - lambda I)$.

For any eigenvalue $lambda$ with algebraic multiplicity $m$ and geometric multiplicity $d$: $1 <= d <= m$.

$T$ is diagonalizable if and only if, for every eigenvalue $lambda_i$, its geometric multiplicity $d_i$ equals its algebraic multiplicity $m_i$. Equivalently, the sum of the dimensions of all eigenspaces equals $n$.

=== Two Ways Diagonalizability Fails

1. The characteristic polynomial may have complex (non-real) roots. For example, rotations of $RR^2$ through a nonzero, non-$pi$ angle have no real eigenvalues.
2. The characteristic polynomial may have repeated roots where the eigenspace is too small. For example, $mat(delim: "[", 1, 1; -1, 3)$ has repeated eigenvalue 2 but only a 1-dimensional eigenspace.

== 9.3 Difference Equations and Ordinary Differential Equations

=== Powers of a Diagonalizable Matrix

If $A = P Lambda P^(-1)$ where $Lambda$ is diagonal, then $A^k = P Lambda^k P^(-1)$. Since $Lambda^k = "diag"(lambda_1^k, dots, lambda_n^k)$, this gives an explicit formula for powers of $A$.

=== Difference Equations

A system $bold(x)_(k+1) = A bold(x)_k$ with initial value $bold(x)_0$ has solution $bold(x)_k = A^k bold(x)_0$. If $A$ is diagonalizable with $P^(-1) bold(x)_0 = mat(delim: "[", c_1; dots.v; c_n)$, then

$ bold(x)_k = c_1 lambda_1^k bold(v)_1 + c_2 lambda_2^k bold(v)_2 + dots.c + c_n lambda_n^k bold(v)_n $

Long-term behavior is dominated by the eigenvalue of largest absolute value.

=== The Matrix Exponential

For any $n times n$ matrix $A$, the matrix exponential is defined by

$ e^A = sum_(k=0)^infinity A^k / (k!) = I + A + 1/2 A^2 + 1/6 A^3 + dots.c $

The series always converges. When $A$ is diagonalizable with $A = P Lambda P^(-1)$:

$ e^A = P e^Lambda P^(-1), quad "where" quad e^Lambda = "diag"(e^(lambda_1), dots, e^(lambda_n)) $

Key property: $(e^(t A))' = A e^(t A)$.

=== Systems of Differential Equations

The initial value problem $dot(bold(x))(t) = A bold(x)(t)$, $bold(x)(0) = bold(x)_0$ has the unique solution $bold(x)(t) = e^(t A) bold(x)_0$. This holds for any $n times n$ matrix $A$, not just diagonalizable ones.

When $A$ is diagonalizable, writing $P^(-1) bold(x)_0 = mat(delim: "[", c_1; dots.v; c_n)$ gives the _normal mode decomposition_:

$ bold(x)(t) = c_1 e^(lambda_1 t) bold(v)_1 + c_2 e^(lambda_2 t) bold(v)_2 + dots.c + c_n e^(lambda_n t) bold(v)_n $

The vector functions $e^(lambda_i t) bold(v)_i$ are the _normal modes_ of the system. In the eigenvector coordinate system, the ODE system decouples into $n$ independent scalar equations $dot(y)_i = lambda_i y_i$.

=== Special Cases

For $A = mat(delim: "[", 0, -1; 1, 0)$, the matrix exponential is the rotation matrix: $e^(t A) = mat(delim: "[", cos t, -sin t; sin t, cos t)$.

For a non-diagonalizable matrix like $A = 2I + B$ where $B^2 = 0$: $e^(t A) = e^(2t)(I + t B)$.

=== Higher-Order ODEs

The $n$th order linear ODE with constant coefficients

$ y^((n))(t) + a_(n-1) y^((n-1))(t) + dots.c + a_1 dot(y)(t) + a_0 y(t) = 0 $

can be converted to a first-order system by setting $bold(x)(t) = mat(delim: "[", y(t); dot(y)(t); dots.v; y^((n-1))(t))$. The solution space is an $n$-dimensional subspace of smooth functions, and the initial value problem (specifying $y(0), dot(y)(0), dots, y^((n-1))(0)$) has a unique solution.

=== Flows

Let $bold(F): U -> RR^n$ be a vector field. The _flow_ of $bold(F)$ is the function $phi.alt_t (bold(x)_0)$ solving $dot(bold(x))(t) = bold(F)(bold(x)(t))$, $bold(x)(0) = bold(x)_0$. For the linear case $bold(F)(bold(x)) = A bold(x)$, the flow is $phi.alt_t (bold(x)) = e^(t A) bold(x)$.

The divergence in $n$ dimensions is $"div" bold(F) = sum_(i=1)^n frac(diff F_i, diff x_i)$.

If $Omega$ is a compact region with piecewise smooth boundary and $cal(V)(t) = "vol"(phi.alt_t (Omega))$, then

$ dot(cal(V))(0) = integral_Omega "div" bold(F) dif V $

This says the rate of change of volume under the flow equals the integral of the divergence -- the infinitesimal version of the Divergence Theorem.

== 9.4 The Spectral Theorem

=== Symmetric Matrices

A square matrix $A$ is symmetric when $A = A^T$. More generally, a linear map $T: RR^n -> RR^n$ is _symmetric_ if $T(bold(x)) dot bold(y) = bold(x) dot T(bold(y))$ for all $bold(x), bold(y) in RR^n$. The key identity is $A bold(x) dot bold(y) = bold(x) dot A^T bold(y)$, which simplifies to $A bold(x) dot bold(y) = bold(x) dot A bold(y)$ when $A$ is symmetric.

=== The Spectral Theorem

The spectral theorem guarantees that symmetric matrices are the best-behaved class for diagonalization.

Let $T: RR^n -> RR^n$ be a symmetric linear map. Then:

1. All eigenvalues of $T$ are real.
2. There is an _orthonormal_ basis for $RR^n$ consisting of eigenvectors of $T$. Equivalently, if $A$ is the standard matrix for $T$, there exists an orthogonal matrix $Q$ so that $Q^(-1) A Q = Q^T A Q = Lambda$ is diagonal.

A crucial step in the proof: if $bold(v)_1$ is an eigenvector with eigenvalue $lambda_1$ and $bold(w) perp bold(v)_1$, then $T(bold(w)) perp bold(v)_1$ as well. This means $T$ maps each eigenspace's orthogonal complement into itself, enabling the inductive argument.

=== Spectral Decomposition

Writing $A = Q Lambda Q^T$ explicitly:

$ A = sum_(i=1)^n lambda_i bold(q)_i bold(q)_i^T $

Multiplying by a symmetric matrix is the same as taking a weighted sum (weighted by eigenvalues) of projections onto the respective eigenspaces.

=== Positive Definiteness

A symmetric matrix $A$ is _positive definite_ if $A bold(x) dot bold(x) > 0$ for all $bold(x) != bold(0)$, _negative definite_ if $A bold(x) dot bold(x) < 0$ for all $bold(x) != bold(0)$, and _positive_ (resp. _negative_) _semidefinite_ if $A bold(x) dot bold(x) >= 0$ (resp. $<= 0$) for all $bold(x)$.

1. $A$ is positive definite iff all eigenvalues are positive
2. $A$ is negative definite iff all eigenvalues are negative
3. $A$ is positive semidefinite iff all eigenvalues are nonnegative
4. If $A$ and $B$ are positive (negative) definite, so is $A + B$
5. If $C$ is any $m times n$ matrix of rank $n$, then $C^T C$ is positive definite
6. $A$ is nonsingular iff every eigenvalue of $A^T A$ is positive
7. The operator norm satisfies $norm(A) = sqrt(lambda)$, where $lambda$ is the largest eigenvalue of $A^T A$

=== Conics and Quadric Surfaces

Any quadratic form $bold(x)^T A bold(x)$ with $A$ symmetric can be simplified by the substitution $bold(y) = Q^T bold(x)$, where $Q$ diagonalizes $A$:

$ bold(x)^T A bold(x) = bold(y)^T Lambda bold(y) = lambda_1 y_1^2 + lambda_2 y_2^2 + dots.c + lambda_n y_n^2 $

This eliminates all cross-terms and reduces conic sections and quadric surfaces to standard form. The new axes are aligned with the eigenvectors of $A$.

1. In $RR^2$: if both eigenvalues have the same sign, we get an ellipse; if opposite signs, a hyperbola; if one is zero, a parabola (when linear terms are present)
2. In $RR^3$: ellipsoids, hyperboloids of 1 or 2 sheets, cones, and (when $A$ is singular and linear terms are present) paraboloids
3. When linear terms $bold(b)^T bold(x)$ are present along with the quadratic, first diagonalize the quadratic part, then complete the square in the new coordinates
