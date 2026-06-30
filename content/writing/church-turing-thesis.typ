// title: The History of the First Computer
// date: 2025-08-11
// description: And the Church-Turing Thesis
// draft: true

#import "../template.typ": *
#show: post

#quote(
  block: true,
  attribution: [Emil Post, 1944],
)[
  _"The conclusion is unescapable that even for such a fixed, well defined body of mathematical propositions, mathematical thinking is, and must remain, essentially creative. To the writer's mind, this conclusion must inevitably result in at least a partial reversal of the entire axiomatic trend of the late nineteenth and early twentieth centuries, with a return to meaning and truth as being of the essence of mathematics."_
]

When people argue about who invented the computer, it turns out that their arguments end up pretty philosophical. Typically, their arguments boil down to the question of "what a computer is". And the answer you give really depends on where you draw the boundary:

+ A calculator is a computer, so Charles Babbage invented the computer with the _difference engine_.
+ To be a computer, you must, in some capacity, be able to "program" it. So Ada Lovelace, who helped Babbage work on the _analytical engine_, invented the computer.
+ To be a computer, both program and data must be stored in the same memory, like in modern machines. So John von Neumann invented the computer with his work on the ENIAC.

Intuitively, (1) seems too limited. Calculators can only perform arithmetic, and cannot do general purpose tasks. (2) seems a little more plausible, but unfortunately neither Babbage nor Lovelace completed their machine in their lifetimes, so we can't really count that, can we? And (3) seems to stray too far into engineering. Why should it philosophically matter for a computer to share its memory with both programs and data?

Somewhere in-between (2) and (3) was Konrad Zuse, who in 1941 built the Z3, a giant, clunky machine which you could actually program. In a way, it was the first working realization of the analytical engine that Babbage and Lovelace dreamed of. But to be honest, my heart goes out to none of the above. The real first computer---at least faithful to how we use the word today---was invented in 1936 by a 23-year-old mathematician named Alan Turing. His device, however, was not made of metal or relays at all --- it was a thought experiment. It was an abstract, mathematical beast, that could in principle compute anything.

What I hope to do is explain how the first rigorous definition of a computer actually emerged, and how it all went down in the midst of an intense mathematical crisis in the early 20th century.

= TL;DR

Metamathematics and logic was the mathematical zeitgeist of the time, and Hilbert, like many others, was incredibly interested in understanding the rigorous structure of logic and math itself. Motivated by this, Hilbert started a program to try to understand mathematics. He told people that math could be totally formalized, and that all of mathematical truth could be derived by a mechanical procedure. Over the next 20 years, results from Gödel, Post, Church, and Turing dismantled this dream. But in the process, they invented and defined _computability_, discovered what it means for something to be _mechanical_, and then discovered the boundaries of these processes.

= Historical Context

It was in the year 1900 when mathematician David Hilbert gave a very very influential talk during an international conference. In his talk, Hilbert basically trauma dumped a list of twenty-three#footnote[He actually had twenty-four problems, one was cut.] unsolved math problems onto the math community, which he believed were _the_ important problems to work on. His talk ended up being fairly influential and set the tone of mathematics for the next half-a-century. It turned out, however, that many of the problems were astronomically challenging, and that, even after three decades, many of them had remained unsolved. So, between 1900 and 1928 his focus began to shift from solving hard math problems into solving problems about mathematics itself, i.e., metamathematics. This was especially enabled by advances in symbolic logic (Frege, Peano, Whitehead & Russell) which made it possible to treat proofs as mathematical objects that themselves could be studied and formalized.

At the same time, people kept asking Hilbert lots of questions about what his problems even meant. In his list of problems, Hilbert proposed some vague and ill-defined problems. In particular, problem no. 10 said the following:

#quote(block: true)[
  _Given a Diophantine equation with any number of unknown quantities and with rational integral coefficients: To devise a process according to which it can be determined in a finite number of operations whether the equation is solvable in rational integers._
]

Here, people were wondering what exactly was a "process" was and what exactly constituted an "operation"? There were some intuitive notions, but no concrete mathematical formalisms. Over time, Hilbert's specific question no. 10 developed into the question of if it were possible to generate a "decision procedure" that could tell you the correctness of _any_ formula, not just Diophantine ones. Such a procedure would be able to solve any mathematical question. So, motivated by all of these questions, Hilbert refines problem no. 10 into three separate goals.

#quote(
  block: true,
  attribution: [summary by Stephen Hawking],
)[
  + To prove that all true mathematical statements could be proven, that is, the *completeness* of mathematics.
  + To prove that only true mathematical statements could be proven, that is, the *consistency* of mathematics.
  + To prove the decidability of mathematics, that is, the existence of a *decision procedure* to decide the truth or falsity of any given mathematical proposition.
]

By 1931, Kurt Gödel completely cooked statements (1) and (2) with his now-famous incompleteness theorems, which basically said the two statements were mutually exclusive.#footnote[For "useful" axiomatic systems.] Statement (3), however, is the important one, and will be the focus of much of this blog. It essentially refined Hilbert's problem no. 10, and he coined this version of the problem the _Entscheidungsproblem_.#footnote[German for "decision problem".]

This problem garnered international mathematical interest, but once again it was not entirely clear what it meant because "decision procedure" was still not clearly defined. In fact, mathematicians were really struggling to define the notion of _procedure_, or _computability_ in a rigorous way that aligned with their intuitions. Remember, at this time, _computers_ were really called _human computers_, because they were just people who carried out arithmetic calculations by hand. Thus, it made sense to call something _computable_ if it could be carried out by hand with a paper and a pencil. But this is far from a rigorous definition.#footnote[At this point, you may be wondering, how exactly one should set out to _prove_ that a certain definition of computable is correct once we come to it? It turns out we cannot! In the same way we cannot say that Euclid's axioms of geometry are correct or that the ZFC axioms of math are correct, we can't really say that what we define computability as is going to be correct, so the goal is to give a philosophical "best guess" that aligns with our general sentiments and the observations of the world around us.]

To make progress, mathematicians looked at functions on the natural numbers and tried to devise some sort of definition that would allow them to call their functions computable. They looked at functions specifically because a decision procedure for a formula is basically a function: input a formula, output yes (provable/true) or no. The end goal was to find some axiomatic system to define functions by, such that any function composed of these axioms was considered a computable function.

The first potential candidate of good definition of computable was the set of _primitive recursive_ functions. These were functions created by using the two operators of composition ($compose$) and recursion ($rho$) on a base set of some primitive functions. These appeared very promising to Hilbert and others, but unfortunately, mathematician Gabriel Sudan dashed his dreams by finding an example of a function that is not primitive recursive that could easily be calculated with pencil and paper. A year later, in 1928, Wilhelm Ackermann spit in his face even further by giving a simpler and now super famous example---the Ackermann function. This forced Hilbert and others to broaden their definition of computability, and in 1934, another candidate appeared. This time, Gödel appeared again to introduce _general recursive functions_, a richer class of functions which were similar to the primitive recursive ones but included the minimization operator ($mu$), which allowed a sort of "unbounded search" on the natural numbers. This richer class became a serious candidate for formalizing computable functions.

= Enter, Alonzo Church

In early 1936, mathematician Alonzo Church decided that he too wanted to tackle the Entscheidungsproblem. Partially, he was motivated by this new invention he had come up with to study formal systems, the $lambda$ calculus.#footnote[This has nothing to do with differential or integral calculus.] It just turned out that the system he studied actually encoded computation pretty well. He continued working on it and eventually published "An Unsolvable Problem of Elementary Number Theory". His paper accomplished two things:

+ He philosophically decides that his $lambda$ calculus was a good formalism for "effective computation".
+ He shows that the Entscheidungsproblem is unsolvable within the class of $lambda$-definable functions

$therefore$ Entscheidungsproblem is false!

First, what is Church's evidence for (1)? Well, previously, he had tasked his graduate students to do some work for him, and Stephen Kleene was able to come back and prove that the set of $lambda$-definable functions was equivalent to the set of general recursive functions. Now this is interesting! The $lambda$ calculus was a very different way of defining computability. Yet, the fact that two entirely separate formalisms were equivalently computationally powerful was good evidence that both these were good notions of "effectively computable". Church also went a little further and tried to justify his $lambda$ calculus as a good notion of computability because, it's sorta like... vibes#footnote[Drastically oversimplifying.], u know? But he received some push back on this. We will get back to this point soon.

Addressing part (2) of his paper, this was an incredibly awesome contribution! Church takes his $lambda$ calculus and performs some complicated proof involving diagonalization and shows there's no logical procedure for determining if a "$lambda$ term" is in normal form, and by some complicated construction this can map to determining the truth or falsity of a mathematical formula. So there's no $lambda$ calculus procedure (and therefore no effectively computable procedure) to determine the validity of a formula.

Wohoo!!!! That must mean we've solved the Entscheidungsproblem with a negative result!? As long as you agree that $lambda$-definable is a good notion for _effectively computable_. But we all agree guys, right?

Well, Church's paper was definitely groundbreaking, but met with some skepticism. Notably, Emil Leon Post, who did not trust Church's weak evidence for (1) and sought some "psychological fidelity" that lambda calculus is a good definition for effectively computable. Motivated by this, Post explores yet a third notion of computation, called a Post machine, that he thinks captures the "psychological" spirit of a (human) computer even better. And Post was really really close---but somebody beat him to the punchline.#footnote[Credit where credit is due, in his work, Emil Post basically independently invents a formalism extremely similar (and nearly as elegant) as Turing machines. What sucks is that he is largely not recognized for this accomplishment. This is especially tragic because two decades prior, he had an early result which basically predicted Gödel's incompleteness theorems, but never published those results! So not once, but twice did Post have his incredibly seminal research be overshadowed by greater results. In part, Post failed to publish out of fear of his work being incomplete (which it slightly was), as well as as some personal struggles with bipolar disorder. But he was definitely ahead of his time, and not often recognized as such.]

= Enter, Alan Turing

23 year old Turing was a research fellow at King's College in Cambridge.#footnote[England, not Massachusetts.] His big goal, just like Church, was to solve the Entscheidungsproblem. He had just taken some a class about the foundations of mathematics and was greatly inspired. For about a year Turing developed his ideas and in May 1936, only a month after Church's paper was published (and completely independently of Church's work) Turing submitted "On Computable Numbers, with an Application to the Entscheidungsproblem".

Before we finally unravel the Church-Turing thesis, I just want to appreciate the genius of Turing's paper. Though a few of the ideas that led to it were independently formalized in similar ways by both Church and Post, no one was as capable of putting them together in as a profoundly elegant way. In his paper, Turing:

- Introduces the Turing machine
- Constructs a universal Turing machine (i.e. invents the "computer" as we know it)
- Formalizes computability as anything that can be done on a Turing machine
- Justifies this formalism with a "direct appeal to intuition"
- Shows his Turing machines are equivalent to the $lambda$ calculus and general recursiveness#footnote[This was actually done in a later appendix published later after he discovered Church's work.]
- Proves that there are limits to computation#footnote[Incomputable numbers and his famous halting problem.]
- Uses this to disprove the Entscheidungsproblem

Obviously, the most important contribution of this paper and what Turing is most known for, is the invention of the Turing machine. In some sense, this invention is truly the the _start_ of computer science, as it marks the first useful formalism for studying the science of computation. General recursiveness and $lambda$ calculus, while powerful, were incredibly unwieldy and difficult to reason about. Most of the proofs for those formalisms involved brute force computation. Turing's machine, however, allowed people to reason about computation in an intuitive way similar to how humans perform procedures.

So how did Turing stumble across such an effective definition?

He took a look at how _human_ computers operated, and distilled it into its first principles. He started with imagining a human with a pencil and paper, and then kept stripping it down in multiple steps, distilling each "core concept" into its simplest possible form. Once he could strip it down no further, he called the resulting mathematical mechanism a _Turing machine._

Turing says it best in his own paper:

#quote(
  block: true,
  attribution: [Alan Turing, "On Computable Numbers" (1936)],
)[
  Computing is normally done by writing certain symbols on paper. We may suppose this paper is divided into squares like a child's arithmetic book. In elementary arithmetic the two-dimensional character of the paper is sometimes used. But such a use is always avoidable, and I think it will be agreed that the two-dimensional character of paper is no essential of computation. I assume then that the computation is carried out on one-dimensional paper, i.e. on a tape divided into squares. I shall also suppose that the number of symbols which may be printed is finite. If we were to allow an infinity of symbols, then there would be symbols differing to an arbitrarily small extent. The effect of this restriction of the number of symbols is not very serious. It is always possible to use sequences of symbols in the place of single symbols. Thus an Arabic numeral such as 17 or 999999999999999 is normally treated as a single symbol. Similarly, in any European language words are treated as single symbols (Chinese, however, attempts to have an enumerable infinity of symbols).

  The difference from our point of view between the single and compound symbols is that the compound symbols, if they are too lengthy, cannot be observed at one glance. This is in accordance with experience. We cannot tell at a glance whether 9999999999999999 and 999999999999999 are the same.

  The behaviour of the computer at any moment is determined by the symbols which he is observing, and his "state of mind" at that moment. We may suppose that there is a bound B to the number of symbols or squares which the computer can observe at one moment. If he wishes to observe more, he must use successive observations. We will also suppose that the number of states of mind which need be taken into account is finite. The reasons for this are of the same character as those which restrict the number of symbols. If we admitted an infinity of states of mind, some of them would be "arbitrarily close" and would be confused. Again, the restriction is not one which seriously affects computation, since the use of more complicated states of mind can be avoided by writing more symbols on the tape.

  Let us imagine the operations performed by the computer to be split up into "simple operations" which are so elementary that it is not easy to imagine them further divided. Every such operation consists of some change of the physical system consisting of the computer and his tape. We know the state of the system if we know the sequence of symbols on the tape, which of these are observed by the computer (possibly with a special order), and the state of mind of the computer. We may suppose that in a simple operation not more than one symbol is altered. Any other changes can be split up into simple changes of this kind. The situation in regard to the squares whose symbols may be altered in this way is the same as in regard to the observed squares. We may, therefore, without loss of generality, assume that the squares whose symbols are changed are always "observed" squares.

  Besides these changes of symbols, the simple operations must include changes of distribution of observed squares. The new observed squares must be immediately recognisable by the computer. I think it is reasonable to suppose that they can only be squares whose distance from the closest of the immediately previously observed squares does not exceed a certain fixed amount. Let us say that each of the new observed squares is within L squares of an immediately previously observed square.

  The simple operations must therefore include:

  #h(1em) (a) Changes of the symbol on one of the observed squares.

  #h(1em) (b) Changes of one of the squares observed to another square within L squares of one of the previously observed squares.

  It may be that some of these changes necessarily involve a change of state of mind. The most general single operation must therefore be taken to be one of the following:

  #h(1em) (A) A possible change (a) of symbol together with a possible change of state of mind.

  #h(1em) (B) A possible change (b) of observed squares, together with a possible change of state of mind.

  The operation actually performed is determined [...] by the state of mind of the computer and the observed symbols. In particular, they determine the state of mind of the computer after the operation is carried out.

  We may now construct a machine to do the work of this computer. To each state of mind of the computer corresponds an "m-configuration" of the machine. The machine scans B squares corresponding to the B squares observed by the computer. In any move the machine can change a symbol on a scanned square or can change any one of the scanned squares to another square distant not more than L squares from one of the other scanned squares. The move which is done, and the succeeding configuration, are determined by the scanned symbol and the m-configuration.
]

= Turing's "Proof" [IN PROGRESS]

Remember, the Church-Turing thesis is not a formal statement, nor has it been proved, nor can it possibly be proved. It is not mathematical, it is philosophical.

But it is a really solid argument which convinced the world that his Turing machine was able to essentially capture computation. The whole point was he was trying to determine what makes a number computable. By computable, they mean "a human computer could do it".

Remember, the axioms are formal systems we adopt, and we judge them based on their consistency, usefulness, and alignment with our intuitions. Church-Turing's thesis says that a Turing machine is a great definition because (Church's Thesis) the Turing machine matches all independently developed models like lambda calculus and general recursion, and (Turing's Thesis) the Turing machine is equivalent in power to the human mind.

The Turing machine also corresponds well to what real-world digital computers can do. And no counterexamples (a "reasonable" model of computation stronger than Turing machines) have been found, except ones relying on idealized physics (like oracle machines or infinite precision).

_[IN PROGRESS: this section needs to be rewritten in prose rather than notes.]_

The rough plan:

- Lay out Turing's own step-by-step reduction: from a human with pencil and paper, to bounded symbols, to bounded states of mind, to local/observable squares, to atomic operations.
- Close with the if-and-only-if argument. One direction is trivial ($L("TM") subset.eq L("Human")$: a human can simulate a TM). The other direction ($L("Human") subset.eq L("TM")$) is the hard one --- we start with a human and keep stripping away until they _are_ a Turing machine.
- Tie back to the "fathomability criterion": a model $C$ is fathomable if you can "think about it". $L(C) subset.eq L("Human")$ because a human can simulate $C$ by thinking about it.

= Broader Implications [IN PROGRESS]

_[IN PROGRESS: the rest of this is mostly a philosophical ramble and not really historical.]_

The greatest application of the Church-Turing thesis is as follows---if you can conceive of some algorithm (to some extent), then there must exist some device that can perform it (to some extent). But this kinda gives us two axes by which we can evaluate to what extent we believe both premises. This creates a sort of alignment chart.

_I am logically pure and existentially rebellious._

The basic outline of the C-T thesis argument is as follows. Turing states that any "fathomable" algorithm can be done by a human. In other words, if the algorithm is fathomable, then the human can perform every step of the algorithm (perhaps using some pen and paper as scratchwork) until they achieve the result. Then he reduces the human being performing the algorithm until it is the same as a machine, and deduces that anything a human could compute, the Turing machine could compute just as well.

First and foremost, what does it mean to be "fathomable"? Because of the structure of the proof, the fathomability criterion has to be strong enough so that a human being could theoretically perform every step of the algorithm. Otherwise, a human being would have no way to sit down and compute the algorithm. The fathomability criterion cannot simply be to fathom the inputs and the outputs. For example, here is an association between input and output. For each natural number $n in NN$, associate $n$ with another truly random number $n' in NN$. By _truly random_, I mean that there is absolutely no computational way to predict the output given the input. Of course, this is a valid association, and is probably even a useful association. But there is no way to fathom the algorithm to compute this, because such a fathomable algorithm would contradict the premise of the true randomness itself. The only possible way that an algorithm could be fathomable is if the algorithm was concretely formalized so that a human being could follow it step by step. Thus, we are logically purist.

Existentially, however, I am rebellious in the application of the C-T thesis. Being a rebel, I don't disagree with the neutral and purist points of view. If a machine has been physically realized or plausibly realized, that is great evidence that the machine can exist. However, it's worth considering what Turing even means by a machine _existing_. In his argument, Turing says that any fathomable algorithm can be computed on a Turing machine. However, a Turing machine is not a concrete or made-up-of-matter object. Although it can be (and has been) physically realized, it does not need to be. It is a formal/mathematical idea of a computational process. Although we can approximate Turing machines in the real world, the concept of the machine itself is a purely mathematical idea---an idea that is held up only by arbitrarily agreed upon axioms like ZFC.

Because a Turing machine is itself an ideal, it has the computational power to compute on ideals, like geometric shapes. For example, consider the integers. I would argue that integers are ideals. Think about it, are integers even real? Think about measuring something. No line could ever be measured to be a perfect, integer amount. Or no physically realized angle could ever be exactly five radii. What about counting, you may ask? You could say that having three apples on a table perfectly represents the ideal form of the integer _3_. However, human beings have defined what an apple is. We have repeatedly found a pattern in nature and have decided to ascribe to it a definition. By using our _ideal_ definition of an apple, we demarcate the apples into three distinct quantities. If the same three apples were blended up into a paste and spread out thinly over the table, you'd have a hard time saying that there's three apples on the table. You can't even count individual atoms, because the atomic model is just a theoretical model (a.k.a. an ideal) that we use to describe the world. We have no idea if that's even what the world is---we only care about its predictive success. However, you cannot argue that a Turing machine doesn't work with integers, because it works with them just fine! It does this because it itself lives in the world of ideals, along with the integers. As long as it can find some way to represent them, like binary, or unary, or something else, the Turing machine can compute on them without a problem. The same is true for other ideals, like abstract shapes. As long as they can be encoded (which they will always be if they are fathomable), then we can operate on them with a Turing machine.

This argument is not new, and is essentially platonism (more specifically, #link("https://iep.utm.edu/mathplat/")[mathematical platonism]).

_"Whether electrons 'exist' in some mind-independent sense is, under that view, not even a meaningful question --- only the model's predictive success matters."_

/*
==================================================================
RAW NOTES AND RAMBLINGS FROM WRITING --- not for publication
==================================================================

in a highly simplified way,
The Church-Turing Thesis has two parts:
Church's Thesis : Any serious formalization of computation is equivalent to the Turing machine
Turing's Thesis : The Turing Machine is equivalent in power to the Human Mind

Church:
their argument was that since two very different formalisms of
effective calculability were the same meant that therefore they were a good
notion of effective calculability

if not for Turing, our "evidence" for the thesis would basically be
to find some sort of formalism of computing and show its equivalent to
everything else

https://inference-review.com/article/psychological-fidelity Emil Post,
Solvability, Provability, Definability: The Collected Works of
Emil L. Post, ed. Martin Davis (Boston: Birkhauser, 1994), 429.

first we need to agree that if a thing is computable by a turing machine,
then its effectively computable. i hope you would agree with this. its
pretty uncontroversial

the second statement is more assertive it asserts that no effective
procedure exists outside the Turing machine model.

effective --- basically means that a human computer could do it
in those times they were comparing it to a human clerk with a pencil
and paper

QUOTE:
Hilbert's original description of problem 10 begins as follows:

"10. Determination of the solvability of a Diophantine equation. Given
a Diophantine equation with any number of unknown quantities and with
rational integral coefficients: To devise a process according to which
it can be determined in a finite number of operations whether the
equation is solvable in rational integers."

Three problems from Hilbert's 2nd and 10th problems
At the 1928 Congress [in Bologna, Italy] Hilbert refines the question
very carefully into three parts. The following is Stephen Hawking's
summary:

"1. To prove that all true mathematical statements could be proven,
that is, the completeness of mathematics.
"2. To prove that only true mathematical statements could be proven,
that is, the consistency of mathematics,
"3. To prove the decidability of mathematics, that is, the existence
of a decision procedure to decide the truth or falsity of any given
mathematical proposition."

This question tests your ability to construct and defend a rigorous
formal argument. Recall one of the greatest applications of the
Church-Turing Thesis. You may be considerate of an algorithm (to some
extent) and then, by the Church-Turing Thesis, a device must exist (to
some extent). Your assignment is to determine to what extents does the
Church-Turing Thesis apply. See the attached chart on canvas. There
are two axii. One of logical purism, neutrality, and rebellion. The
other of existential purism, neutrality, and rebellion. I have
provided an example for each of the nine categories, organized into a
three by three table. Write a rigorous and persuasive argument as to
which of the nine categories you can best apply the Church-Turing
Thesis. Note you are not arguing correctness of the provided example,
but of its category. Your argument should convince me your selection
of the nine is correct, and the other eight are incorrect. In
presenting Turing's Thesis, Alan Turing operated on some set of
unstated premises of the intuitive nature of computation. Read his
argument carefully and choose a category which best extends from his
unstated, assumed premises.

The Church-Turing Thesis cannot be proved. Most agree that it is some
kind of definition or worse, a "working hypothesis". Here, we will
give the closest thing to a proof possible. Recall the narrative of
our class. First we did regular languages, that was level one. We
pumped out of those to get some context-free languages, that was level
two. Now we are on level three, Turing machines. The Church-Turing
Thesis asserts that there is no level four.

The Church-Turing Thesis has two parts:
Turing's Thesis : The Turing Machine is equivalent in power to the Human Mind
Church's Thesis : Any serious formalization of computation is equivalent to the Turing machine

Together, these imply that a Turing Machine, although incredibly
simple, is an excellent choice for us to reason about computation.
The intuitive notion of computation corresponds to the Turing machine,
and that the intuitive notion of computation may be considered
independent of a specific formalism. Both Turing's Thesis and Church's
Thesis are required.

A philosophical argument is unlike a proof. We want to make a
convincing argument of some statement. The way we will do so is make
atomic jumps, each convincing, then argue that the composition must be
convincing.

I) turing machines are equivalent in power to the human mind
II) there is no computing device strictly stronger than the human Mind

L(human) is the language of stuff that, if with pen and paper, you
could decide. "yeah i could do that"

L(TM) subset of L(human) easily (human simulates TM)

fathomablility criterion
let C be some computation model (DFA, TM, etc)
C is fathomable if you can "think about it"
L(C) subset L(Human) because human simulates C by thinking about it

-----
L(human) subset L(TM). HOW? How can we simulate a human on a TM.
make small changes to human until it turns into a TM

https://www.youtube.com/watch?v=D552RSlaLLw

A program may be executed independent of its physical realizability.

A program specifies what must occur, exactly in the order that it must
occur.

DND alignment chart

Turing didn't just produce another formalism --- he started from first
principles about what it means for a human to calculate:

A finite set of states of mind (program control).
A finite alphabet of symbols (memory content).
A bounded amount of information accessible at a time (locality).
Explicit, mechanical rules (no guessing).
Sequential steps of operation.

From that analysis, he derived the Turing machine model, which
naturally had:

State: the internal configuration of the machine.
Memory: the tape, potentially infinite.
Programs: the transition table.
Movement: the read/write head shifting left or right.

Post's doubts as to whether or not recursion was an adequate
definition of "effective calculability",

A machine with countably infinite states and symbols, arbitrary
computable jump moves on a 3D infinite tape, unbounded but computable
nondeterminism, and any number of heads --- but with its entire
description generated by a finite, computable program.

=== Missing visuals from original draft ===
- /images/blog/2025-8-11-ct-thesis/vibe.mp4
  (credit @ciguleva on x.com) --- intro vibe video
- /images/blog/2025-8-11-ct-thesis/post.jpeg
  "Emil Post looking very disappointed."
- /images/blog/2025-8-11-ct-thesis/dunk.png
  "Live footage of Turing submitting his paper." (cat dunking)
- alignment chart image for broader implications section
*/
