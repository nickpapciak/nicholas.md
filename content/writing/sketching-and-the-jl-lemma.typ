// title: Dealing with High-Dimensional Data
// date: 2025-06-09
// description: Sketching & the JL-Lemma

#import "../template.typ": *
#show: post

It's extremely common in computer science to be dealing with very high-dimensional vectors. A natural question is can we _sketch_, or reduce the dimensionality, of these vectors while still maintaining the larger structure of the data. A common application of this is clustering, where we cluster datapoints based on their distances to other data. For this kind of application, we need to be able to maintain the pairwise distances between any two datapoints.

#figure(image("../../public/images/blog/sketching/clustering.png", width: 70%))

In particular, given vectors $v_1, dots, v_n in RR^d$, where the dimension $d$ is large, we want to find a function $f: RR^d -> RR^m$ where $m << d$ and pairwise distances are preserved. In other words, we want

#definition[$epsilon$ Pairwise Distance Property][
For all pairs $v_i, v_j in (v_1, dots, v_n)$ and some small $epsilon$

$ (1 - epsilon) norm(v_i - v_j) <= norm(f(v_i) - f(v_j)) <= (1 + epsilon) norm(v_i - v_j) $

which tells us that $f$ should be able to preserve the distance between any two vectors with greater and greater accuracy as our parameter $epsilon$ approaches 0.
]

#theorem[Johnson-Lindenstrauss][
For $m > O(log(n) \/ epsilon^2)$, there exists $f$ satisfying the equation above. This means that $n$ points in a high dimensional space can be mapped onto $m$ dimensions and still preserve pairwise distance. Actually, it turns out $f$ is a linear map and can be computed in a computationally efficient way.
]

_Algorithm idea._ Our first attempt at dimensionality reduction may involve trying to choose some subset of coordinates to include from each vector at random. However, this attempt fails because the accuracy depends a lot on the basis the vectors are represented in. The actual idea is as follows. We are going to generate a vector $g in RR^d$ that points in a random direction and take the product $angle.l v, g angle.r$. We do this $m = cal(O)(log(n))$ times, storing each result in a vector $in RR^m$. The main intuition behind this is that $angle.l v, g angle.r = norm(v) norm(g) cos(theta) prop norm(v)$, and that viewing the vector from many different directions gives you a lot of information about the vector.

#figure(image("../../public/images/blog/sketching/projection.svg", width: 40%))

The way we generate a vector in a random direction is by generating a vector where each individual entry is i.i.d from a Gaussian $cal(N)(0, 1)$. We won't prove why this works, but the intuition is that applying any orthogonal matrix (i.e. a distance-preserving linear mapping, where $U^T U = I$) to a Gaussian random vector leads to another random vector with the same distribution. Since rotation preserves distances, the distribution is invariant to rotation, so it must be that the Gaussian random vectors are uniformly distributed across all directions. Putting this all together, this gives rise to the following algorithm.

#line(length: 100%, stroke: 0.5pt + rgb("#100F0F").lighten(88%))

_Algorithm._ Build the matrix $A in RR^(m times d)$ where each row is a random Gaussian vector, which just means that each entry $A_(i j) tilde cal(N)(0, 1)$, and then scale each entry by $1 / sqrt(m)$. Then compute $f(v) = A v$, which takes the product of all the scaled, random $d$-dimensional Gaussian row vectors.

#figure(image("../../public/images/blog/sketching/matrix.svg", width: 70%))

= Johnson-Lindenstrauss Property

#definition[$(epsilon, delta)$ JL Property][
A distribution over matrices $A in RR^(m times d)$ satisfies this property if

whenever $m = cal(O)(log(1 \/ delta) \/ epsilon^2)$, for any $v in RR^d$, the inequality

$ (1 - epsilon) norm(v) <= norm(A v) <= (1 + epsilon) norm(v) $

holds with probability $1 - delta$.
]

#remark[
Notice that if we can show that $A$ satisfies the JL property, then we will be able to prove the JL theorem. Consider picking one of the $binom(n, 2)$ pairs of vectors $v_i, v_j$, and use that pair to form $v_i - v_j$. Then, we know $norm(A(v_i - v_j)) = norm(A v_i - A v_j) = norm(f(v_i) - f(v_j))$. If $A$ satisfies the $(epsilon, delta)$ JL property, then this pair will preserve distance with probability $(1 - delta)$, and will fail to preserve distance with probability $delta$. If we let $F_i$ be an indicator r.v. denoting if our pair fails, then we fail any pair with probability

$ "Pr"(F_1 union dots union F_n) <= sum_i "Pr"(F_i) = binom(n, 2) delta $

So choosing $delta < delta^* \/ binom(n, 2)$, if $A$ satisfies the $(epsilon, delta)$ property, then we preserve all pairwise distances with probability $1 - delta^*$, as long as $m = cal(O)(log(n \/ delta) \/ epsilon^2)$.
]

#remark[
We will show that our matrix $A$ satisfies the property, but it is not the only such matrix. For example, the Rademacher matrices, where each entry is independently chosen to be either $+1\/sqrt(m)$ or $-1\/sqrt(m)$ with equal probability satisfy the property. A random orthogonal matrix will also satisfy the property.
]

#theorem[
Our construction of $A$ satisfies the $(epsilon, delta)$ JL property
]

#proof[
  Consider some $v in RR^d$. It suffices to prove the theorem for a unit vector where $norm(v) = 1$, since to prove it for full generality we just introduce a bunch of scaling factors.

  An important fact is the stability of Gaussian r.v.s. If we have two independent Gaussians and take a linear combination of them, $a_1 cal(N)(mu_1, sigma_1^2) + a_2 cal(N)(mu_2, sigma_2^2)$ will follow the distribution $cal(N)(a_1 mu_1 + a_2 mu_2, a_1^2 sigma_1^2 + a_2^2 sigma_2^2)$. We can use this to show if we take the product of $v$ with some random Gaussian vector $g$, it's distributed as:

  $ angle.l v, g angle.r = sum_(i=1)^d [v]_i dot cal(N)(0, 1) = cal(N) lr((0, sum_(i=1)^d [v]_i^2)) = cal(N)(0, norm(v)^2) = cal(N)(0, 1) $

  If we let $g_i$ denote the $i$th row of $A$, this tells us that:

  $ A v = 1 / sqrt(m) (angle.l v, g_1 angle.r, dots, angle.l v, g_m angle.r) = 1 / sqrt(m) (y_1, dots, y_m), quad y_i tilde cal(N)(0, 1) $

  Now, we want to show that $"Pr"(norm(A v) >= (1+epsilon) norm(v))$ and $"Pr"(norm(A v) <= (1-epsilon) norm(v))$ are both small. We do this by proving the stronger inequalities on the squared norm:

  $
  "Pr"(norm(A v)^2 >= (1+epsilon) norm(v)^2) &= "Pr" lr((sum_(i=1)^m y_i^2 >= (1+epsilon) m)) \
  &= "Pr" lr((e^(lambda sum y_i^2) >= e^(lambda(1+epsilon)m))) \
  &<= frac(EE lr([e^(lambda sum y_i^2)]), e^(lambda(1+epsilon)m)) \
  &= product_(i=1)^m frac(EE lr([e^(lambda y_i^2)]), e^(lambda(1+epsilon))) \
  &= lr((frac(1, sqrt(1 - 2 lambda) dot e^(lambda(1+epsilon)))))^m \
  &<= lr(((1 + epsilon) e^(-epsilon)))^(m\/2) \
  &<= delta\/2
  $

  A nearly identical proof shows:

  $
  "Pr"(norm(A v)^2 <= (1 - epsilon) norm(v)^2) &= "Pr" lr((e^(-lambda sum y_i^2) >= e^(-lambda(1 - epsilon)m))) \
  &<= frac(EE lr([e^(-lambda sum y_i^2)]), e^(-lambda(1 - epsilon)m)) \
  &= lr((frac(1, sqrt(1 + 2 lambda) dot e^(-lambda(1 - epsilon)))))^m \
  &<= lr(((1 - epsilon) e^(-epsilon)))^(m\/2) \
  &<= delta\/2
  $

  So that $"Pr"("out of bounds") <= delta$, proving that our construction satisfies the JL theorem.
]

= Algorithmic Speedup

The naive algorithm to compute all pairwise distances takes $cal(O)(n^2 d)$ time, to compute the distance in $cal(O)(d)$ time for $binom(n, 2)$ pairs. Since the matrix is dimension $cal(O)(log(n)) times d$, it takes $cal(O)(d log(n))$ time to project a vector down, and we do this $n$ times. Once we have the lower dimensional vectors, however, we just need to compute the $binom(n, 2) = cal(O)(n^2)$ pairwise distances in $cal(O)(log(n))$ time each. So the algorithm runs in $cal(O)(d n log(n) + n^2 log(n))$ time, which is good if $d >> log(n)$. This says we can get a good approximation much quicker than brute-force!

= Subspace Embedding

Let $U$ be a $d$-dimensional space. We're interested in a $k$-dimensional subspace of this space. Given $v_1, v_2, dots, v_k in U$, let $S = op("span")(v_1, v_2, dots, v_k)$.

*Theorem*\
If we project each $v in U$ to $A v$, then when $m > (k log(1 \/ epsilon) + log(1 \/ delta)) \/ epsilon^2$, we have for all $v in S$

$ (1-epsilon) norm(v) <= norm(A v) <= norm(v)(1+epsilon) $

with probability $1-delta$.

*Proof*\
Ideally, we want to apply the union bound over all vectors in the subspace. However, there's infinitely many vectors, and we can't do that... The main idea is to look at a nearby neighborhood of each vector, called the $epsilon$-net.
