# Optimal Practice Difficulty / Target Success Rate for Learning

**Evidence tags used throughout**
- **[V]** = verified in this session from a search result snippet or abstract.
- **[R]** = I know this finding from the cited paper but could **not** re-check it this session, because nature.com, pmc.ncbi.nlm.nih.gov and core.ac.uk were blocked for page fetches. The source link is correct. Check numbers marked [R] before quoting them as exact.
- **Population/setting** is noted as (children/adults; lab/classroom/web).
- **EMPIRICAL** vs **THEORETICAL/EXTRAPOLATED** is labeled explicitly.

---

## Q1. What does Wilson, Shenhav, Straccia & Cohen (2019) "The Eighty Five Percent Rule" actually show, and does it apply to human academic learning?

### Takeaway
The 85% figure is a **mathematical result for stochastic-gradient-descent learners on binary classification tasks with Gaussian noise**. It is backed by simulations: a perceptron, a two-layer network on MNIST, and the Law & Gold model of monkey perceptual learning. **No new human experiment** tested it, and I found no direct human or academic test from 2020–2026. For human academic study it is a plausible heuristic, not an established law. The exact number depends on the noise assumptions (85% → 82% → 75%).

### Cited Findings
- **Citation:** Wilson, R. C., Shenhav, A., Straccia, M., & Cohen, J. D. (2019). *The Eighty Five Percent Rule for optimal learning*. **Nature Communications**, 10, 4646. DOI 10.1038/s41467-019-12552-4. Preprint on bioRxiv 2018 (255182). — [Nature](https://www.nature.com/articles/s41467-019-12552-4); [bioRxiv preprint](https://www.biorxiv.org/content/10.1101/255182v1); [author PDF](https://worthylab.org/wp-content/uploads/2020/01/eightyfivepercentrule_naturecomm_2019.pdf) [V]
- **Scope (THEORETICAL):** the authors "derive conditions for this sweet spot for a broad class of learning algorithms **in the context of binary classification tasks**." The paper examines one variable only, the difficulty of training. — [Semantic Scholar record](https://www.semanticscholar.org/paper/The-Eighty-Five-Percent-Rule-for-optimal-learning-Wilson-Shenhav/f29e7684a25a2fc880d049a03147decae475e1ca); [Nature](https://www.nature.com/articles/s41467-019-12552-4) [V]
- **Core number:** "For all of these **stochastic gradient-descent based** learning algorithms … the optimal error rate for training is around **15.87%** or, conversely, … the optimal training accuracy is about **85%**." — [Nature](https://www.nature.com/articles/s41467-019-12552-4) [V]
- **The number depends on the noise model.** The optimal accuracy is about **85% for Gaussian noise, 82% for Laplacian noise, and 75% for Cauchy noise**. 15.87% equals Φ(−1), the Gaussian tail beyond one SD. The optimal difficulty is the same with or without extra internal (endogenous) noise. — [Nature](https://www.nature.com/articles/s41467-019-12552-4); [ResearchGate copy](https://www.researchgate.net/publication/337036886_The_Eighty_Five_Percent_Rule_for_optimal_learning) [V]
- **What was tested (SIMULATION ONLY):** (1) a one-layer perceptron, (2) a two-layer neural network learning handwritten digits (MNIST), and (3) the Law & Gold (2009) reinforcement-learning model of perceptual learning in monkeys. That model "still implements stochastic gradient descent on the error rate and learning should be optimized at 85%." — [Nature](https://www.nature.com/articles/s41467-019-12552-4); [Neuroscience News summary](https://neurosciencenews.com/learning-optimized-15171/) [V]
- **The human link is a prediction.** Wilson said the rule "would most likely apply to perceptual learning." Press coverage says it "may also apply to humans." The authors also said previous animal-learning studies were consistent with it. — [ScienceDaily](https://www.sciencedaily.com/releases/2019/11/191105113457.htm); [Neuroscience News](https://neurosciencenews.com/learning-optimized-15171/) [V]
- **Mechanism [R]:**
  - "Difficulty" is the distance of a stimulus from the decision boundary. Learning is driven by trial-by-trial **feedback**.
  - The learner's precision rises as it learns, so difficulty must keep **increasing** to hold accuracy at ~85%. It is an *adaptive* target, not a fixed item set.
  - The paper says holding the error rate at the optimum gives much faster learning (it uses the word "exponentially") than training at a **fixed** difficulty.
  - The target maximizes the **rate of learning per trial**. It does not model retention, transfer, motivation or the time cost of items. — [Nature](https://www.nature.com/articles/s41467-019-12552-4)
- **Discussion [R]:** the authors relate the result to Vygotsky's ZPD, flow and curiosity research. They present these links as speculative connections, not tests. — [Nature](https://www.nature.com/articles/s41467-019-12552-4)
- **Critiques (secondary sources only, no formal published rebuttal found):**
  - AQR International argues it should be called an "85% guide" rather than a "rule," because "rule" implies it applies to everyone. — [AQR International](https://aqrinternational.co.uk/the-eighty-five-percent-rule-for-optimal-learning-2) [V]
  - A secondary literature review notes the rule is a result about gradient-descent learners on binary tasks and has not been validated in humans. — [Numberkit literature review](https://axolotladventure.com/research/03-motivation-and-game-design) [V, low-quality secondary]
  - Popular coverage (Big Think, Scott H. Young 2022) states the human application more confidently than the paper does and reports no new human data. — [Scott H. Young](https://www.scotthyoung.com/blog/2022/07/05/85-percent-rule/); [Big Think](https://bigthink.com/neuropsych/learning-failure/) [V]
- **2020–2026 follow-ups:**
  - An extended search found **no** human experiment (2022–2024) that directly tests 85% against other accuracy targets.
  - A 2026 arXiv paper on learning-rate schedules that balance effort and performance cites the rule. I did not verify whether it contains human data. — [arXiv 2601.07830](https://arxiv.org/pdf/2601.07830) [V that it exists; content unverified]

### Inferences
- The 85% rule fits CSAT items such as vocabulary meaning, grammar judgments, and recognizing a problem type only loosely. Those are binary-ish judgments made with immediate feedback. It does **not** directly cover multi-step math problems, essay-like reading inference, or multi-class choices: CSAT 5-option MCQ has a 20% guessing floor.
- With 5-option MCQ, part of observed accuracy is guessing. A raw 85% therefore corresponds to a somewhat lower "true knowing" rate. Correcting for guessing: true ≈ (obs − 0.2)/0.8, so 85% observed ≈ 81% known. This is my own arithmetic, not from the paper.
- The Cauchy (heavy-tailed) result of 75% matters when performance noise is large: guessing, careless errors, fatigue. A novice's performance is likely noisy, so the **75–85% band** is a more defensible target than exactly 85%.
- The rule optimizes learning *per trial*. It is silent on how easy practice affects motivation and persistence, which matter most for an adult starting from near zero (see Q5).

### Gaps
- I could not open the full text (nature.com/PMC blocked). The exact wording of the limitations section and the precise "exponential" speed-up claim are **[R]** and should be checked in the paper.
- I found no peer-reviewed human study that varies target accuracy (e.g., 70/85/95%) on academic material and measures long-term retention, specifically to test this rule.
- Whether the derivation extends to multi-class problems is not covered by any source I could access.

---

## Q2. Bjork's "desirable difficulties": what makes a difficulty desirable vs undesirable, and when does difficulty stop helping?

### Takeaway
A difficulty is desirable only if the learner can **respond to it successfully** (or at least productively). That requires enough prior knowledge and working-memory capacity. The Bjorks themselves stress that **the level of difficulty matters**. For novices on high-element-interactivity material (multi-step math, complex reading), extra difficulty can become *undesirable*. Practice performance is also a poor indicator of learning, because difficulties that lower practice accuracy can raise long-term retention.

### Cited Findings
- **Origin:** Bjork, R. A. (1994). Memory and metamemory considerations in the training of human beings. In J. Metcalfe & A. Shimamura (Eds.), *Metacognition: Knowing about knowing* (pp. 185–205). MIT Press. Bjork & Bjork (2011). Making things hard on yourself, but in a good way. In *Psychology and the Real World*. Both are listed on the Bjork Lab publications page. — [Bjork Lab publications](https://bjorklab.psych.ucla.edu/robert-a-bjork-publications) [R]
- **Bjork & Bjork (2011), the boundary condition in their own words [R; widely quoted]:** desirable difficulties "are desirable because responding to them successfully engages processes that support learning, comprehension, and remembering. If, however, **the learner does not have the background knowledge or skills to respond to them successfully, they become undesirable difficulties**." — [Bjork Lab](https://bjorklab.psych.ucla.edu/robert-a-bjork/)
- **Bjork & Bjork (2020), Desirable Difficulties in Theory and Practice**, *Journal of Applied Research in Memory and Cognition*, 9(4), 475–479. DOI 10.1016/j.jarmac.2020.09.003. A commentary on a JARMAC special issue. [V]
  - The word "desirable" is essential: many difficulties are undesirable during instruction and forever after.
  - **The level of difficulty matters** (citing Bjork & Bjork 2011/2014).
  - Applying these ideas in real-world settings is hard. The FIU law-school work in the special issue is praised as an applied example.
  - — [Bjork Lab PDF](https://bjorklab.psych.ucla.edu/wp-content/uploads/sites/13/2021/01/RABjorkELBjorkJARMAC2020ForPostingSingleSpaced.pdf); [library record](https://opact.sdu.edu.tr/vufind/SummonRecord/FETCH-LOGICAL-a369t-859f370c40b2aa46534be09d4b2df300eed03b928c2be63330fe6a70ed3c48713)
- **Canonical desirable difficulties [R]:** spacing, interleaving, retrieval practice (testing), generation, and varying practice conditions. These **lower performance during practice** but improve long-term retention and transfer. This "performance vs learning" distinction (Bjork 1994) is the core idea. — [APS Observer: Desirable Difficulties](https://www.psychologicalscience.org/observer/desirable-difficulties)
- **When difficulty stops helping: Chen, Castro-Alonso, Paas & Sweller (2018), Frontiers in Psychology, 9:1483** (review, citing the authors' own experiments). DOI 10.3389/fpsyg.2018.01483. [V]
  - Testing, generation and varied practice "are not always beneficial."
  - Many failures to obtain these effects "may occur under conditions where **working memory is already stressed due to the use of high element interactivity information**. Under such conditions, the introduction of additional difficulties may be undesirable rather than desirable."
  - Element interactivity depends on **both the material and the learner's prior knowledge**: the same material has lower element interactivity for an expert.
  - — [Frontiers full text](https://public-pages-files-2025.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2018.01483/text); [PDF](https://andymatuschak.org/files/papers/Chen%20et%20al%20-%202018%20-%20Undesirable%20difficulty%20effects%20in%20the%20learning%20of%20high-element%20interactivity.pdf)
- **A 2026 follow-up** in *Educational Psychology Review* applies element interactivity as a moderator of "exploring before instruction" (productive-failure-style) designs. — [Springer EPR 2026, s10648-026-10223-7](https://link.springer.com/article/10.1007/s10648-026-10223-7) [V that it exists; content not read]

### Inferences
- **Rule for item design:** an item is a "desirable" challenge only if the learner has the component knowledge to attempt it meaningfully.
  - If a near-zero learner gets an item wrong because they lack a prerequisite concept, the difficulty is undesirable.
  - If they get it wrong because retrieval is effortful, or because it is interleaved with similar types, the difficulty is desirable.
- For a near-zero CSAT learner, **math (수학) and long reading passages (국어 비문학, 영어 빈칸/순서)** are high in element interactivity. Prefer worked examples and scaffolded steps first, and add desirable difficulties (interleaving, spaced retrieval) **after** basic schemas exist.
- Low-element-interactivity material, such as English vocabulary, 한국사 facts, and 사회탐구 concepts, tolerates desirable difficulties (testing, spacing) from day one.
- Practice accuracy is a *performance* measure. A practice set that feels easy (≥95%) may produce little durable learning. A spaced, interleaved set at 70–80% may produce more, even though it feels worse. Tell the learner this explicitly, so lower accuracy on spaced/interleaved sets is not read as failure.

### Gaps
- No source gave a numerical threshold such as "below X% accuracy, difficulty becomes undesirable." The boundary is qualitative: prior knowledge, working-memory load.
- I did not search McDaniel & Butler's (2011) "contextual framework" (learner × material × criterial task) or the expertise-reversal literature (Kalyuga). Both are relevant boundary-condition frameworks; not verified here.

---

## Q3. Vygotsky's ZPD and Metcalfe's Region of Proximal Learning: implications for which items to study, and in what order

### Takeaway
**EMPIRICAL (adult lab studies):**
- People with limited time study **"almost learned" items first** (easy → medium) and move to hard items only once those are mastered.
- Studying in this region, rather than on the hardest items, improves learning efficiency, especially for novices and under time pressure.

For item selection this means: skip items already known, prioritize items at the edge of current ability, and postpone items far beyond reach.

### Cited Findings
- **Metcalfe & Kornell (2005)**, "A Region of Proximal Learning model of study time allocation," *Journal of Memory and Language*, 52, 463–477. [V] (adult undergraduates, lab)
  - Two components: **choice** ((1) study or not; (2) order of priority) and **perseverance**.
  - "If people's Judgments of Learning (JOLs) are sufficiently high that they believe they know the items already, they will choose **not to study**. If they do choose to study, the order is **from that which they believe is almost known to that which they believe is more difficult**."
  - People stop studying an item when their judged **rate of learning** (jROL) drops, i.e., when they stop making progress.
  - Under free choice, participants did not focus on the hardest items, contrary to the discrepancy-reduction model. They preferred easy and medium items, and "only as the items of easy and medium difficulty are learned, do they turn to the truly difficult items."
  - — [Columbia PDF](http://www.columbia.edu/cu/psychology/metcalfe/PDFs/Metcalfe%20Kornell%202005.pdf); [ERIC EJ698005](https://eric.ed.gov/?id=EJ698005)
- **Kornell & Metcalfe (2006)**, "Study efficacy and the region of proximal learning framework," *JEP: Learning, Memory, and Cognition*, 32, 609–622. Self-regulated study allocation (honoring the learner's choices) improved learning compared with random or dishonored allocation. [V for the citation and main claim] — [Kornell PDF](https://web.williams.edu/Psychology/Faculty/Kornell/Publications/Kornell.Metcalfe.2006a.pdf); [Semantic Scholar](https://www.semanticscholar.org/paper/Study-efficacy-and-the-region-of-proximal-learning-Kornell-Metcalfe/6d9ec5f63082f14af659cad8389af853585410db)
- **Metcalfe (2002)**, "Is study time allocated selectively to a region of proximal learning?" *JEP: General*, 131, 349–363. [R] (adult undergraduates; Spanish–English vocabulary of graded difficulty)
  - Under **short time limits**, learners concentrated on easy items. With more time, they shifted to medium and then difficult items.
  - Learners with more domain knowledge shifted toward harder items.
  - With limited time, allocation to easier/medium items yielded better learning than allocation to the hardest items.
  - — [Metcalfe RPL page, Columbia](https://www.columbia.edu/cu/psychology/metcalfe/RPL.html); [related RG record](https://www.researchgate.net/publication/8988790_The_Dynamics_of_Learning_and_Allocation_of_Study_Time_to_a_Region_of_Proximal_Learning)
- **The RPL name deliberately echoes Vygotsky's ZPD [R].** Vygotsky (1978, *Mind in Society*) defined the ZPD as the gap between what a learner can do alone and what they can do with guidance. RPL is the metacognitive, self-regulated analogue: items neither already known nor currently out of reach. — [Metcalfe RPL page](https://www.columbia.edu/cu/psychology/metcalfe/RPL.html)

### Inferences
- **Item-selection rule (from RPL):**
  1. Drop or space out items the learner reliably gets right (high JOL / consistently correct).
  2. Prioritize items the learner *almost* gets: partially correct, correct with hints, or wrong on the last step only.
  3. Hold back items where the learner can't even begin, until prerequisites are in place.
- **Ordering rule:** within a session, sequence items from almost-known to harder ones. Within a practice exam meant for learning (not simulation), put easier/medium items first to build momentum. Real CSAT order is also roughly easy → hard within a section.
- **ZPD rule:** items above the independent level are appropriate **only when scaffolding is available**, such as a hint, step-by-step solution or worked example. Without scaffolding, an item above the ZPD is unproductive failure.
- **Time-pressure rule:** a learner with a fixed deadline (2028 CSAT) and near-zero knowledge is in exactly the condition where Metcalfe found an easy/medium focus to be best. Do not spend early months on 킬러 문항.
- Caveat: these are list-learning (vocabulary) studies with adults. Extending them to CSAT problem types is an extrapolation.

### Gaps
- No RPL study states an optimal *accuracy percentage*. "Almost learned" is defined by judgments of learning, not a numeric success rate.
- I found no RPL study on complex problem solving (math) as opposed to paired-associate learning.

---

## Q4. Productive failure (Kapur) and its relation to optimal challenge

### Takeaway
**EMPIRICAL (mostly secondary-school math/science, classroom):** having learners attempt problems *before* instruction (PS-I), with low success expected, followed by instruction, beats instruction-first (I-PS) for **conceptual knowledge and transfer**. The headline bias-corrected effect is **g ≈ 0.87** when designs follow productive-failure principles.

This is **not** a "practice at low success" finding. The failure phase is brief and exploratory and is *always* followed by instruction. The advantage **reverses for young learners (grades 2–5) and domain-general skills**.

### Cited Findings
- **Sinha, T., & Kapur, M. (2021).** When problem solving followed by instruction works: Evidence for productive failure. *Review of Educational Research*, 91(5). DOI 10.3102/00346543211019105. [V]
  - Meta-analysis of **53 studies and 166 comparisons** of PS-I vs I-PS.
  - After correcting for publication bias: "strong effect size favoring PS-I (**Hedge's g 0.87**)."
  - Moderators associated with the PS-I advantage: grade level, intervention duration, and quasi-experimental vs experimental design.
  - The **reverse (I-PS better) held for younger learners (grades 2–5) and for domain-general skills.**
  - — [X-MOL abstract](https://www.x-mol.com/paper/1406031499744456704); [OUCI record](https://ouci.dntb.gov.ua/works/4KnMgZq7)
- Kapur's team described the effect as "nearly twice as efficient as a year of instruction from an outstanding teacher." This is **press rhetoric, not a statistical result.** — [phys.org](https://phys.org/news/2021-09-productively-wiser.pdf); [TechLearning](https://techlearning.com/news/study-productive-failure-a-success-in-education) [V]
- **Kapur (2016)**, "Examining Productive Failure, Productive Success, Unproductive Failure, and Unproductive Success in Learning," *Educational Psychologist*, 51(2), 289–299. DOI 10.1080/00461520.2016.1155457. [V]
  - Uses "the incommensurability of learning and performance" to define four quadrants: **productive success, productive failure, unproductive success, unproductive failure**.
  - The goal of instruction is to maximize *productive* learning, even at the expense of success during the learning phase.
  - Secondary summaries note some evidence that productive failure yields better conceptual knowledge than productive success, but both are productive.
  - — [ResearchGate](https://www.researchgate.net/publication/299996960_Examining_Productive_Failure_Productive_Success_Unproductive_Failure_and_Unproductive_Success_in_Learning); [KU Leuven PDF](https://arch.kuleuven.be/studeren/tall/artikels/examining-productive-failure-productive-success-unproductive-failure-and-unproductive-success-in-learning.pdf/@@download/file/Examining%20Productive%20Failure%20Productive%20Success%20Unproductive%20Failure%20and%20Unproductive%20Success%20in%20Learning.pdf); [summary blog](https://laurenmarg.com/2020/10/24/article-summary-kapur-2016-productive-failure-productive-success-unproductive-failure-and-unproductive-success/)
- **Kapur & Roll, "Productive Failure" (book chapter, ~2024–2025).** A recent overview. — [boldscience PDF](https://boldscience.org/wp-content/uploads/2025/04/Productive-Failure.pdf); [ResearchGate](https://www.researchgate.net/publication/381913649_Productive_Failure) [V that it exists]
- **Earlier, separate review:** 12 articles up to 2015, average effect size about 0.43. It is **not** the Sinha & Kapur meta-analysis and should not be confused with it. — per the search summary of [Frontiers in Education 2022](https://frontiersin.org/articles/10.3389/feduc.2022.956416/pdf) [V, secondary]
- **Related errorful-generation evidence (adults, lab):**
  - Kornell, Hays & Bjork (2009, JEP:LMC) showed that *unsuccessful* retrieval attempts followed by feedback enhance later learning (pretesting effect). [R]
  - Grimaldi & Karpicke (2012, *Memory & Cognition*) examined *when* unsuccessful attempts help. [V for the topic] As I recall, the benefit appeared mainly when the guess was semantically related to the answer. [R]
  - — [Grimaldi & Karpicke 2012 PDF](https://learninglab.psych.purdue.edu/downloads/2012/2012_Grimaldi_Karpicke_MC.pdf); [Vaughn, Hausman & Kornell 2016 PDF](https://hausman.sites.ucsc.edu/files/2023/02/Vaughn.Hausman.Kornell.2016.pdf)

### Inferences
- In productive failure, the *initial-attempt* success rate is very low, often near 0% for the canonical solution. That is fine because (a) the attempt activates prior knowledge and exposes gaps, and (b) **instruction or explanation follows immediately**.
- For practice-exam design this licenses a small "**preview/challenge**" block: 1–3 items on a not-yet-taught concept, with low expected success. It needs a full worked explanation right after, and the learner should be told the score on that block does not count.
- It does **not** license whole practice sets at low success.
- Boundary for a near-zero adult:
  - PS-I needs enough prior knowledge to generate *some* representations or solution attempts. The reversal for grades 2–5 suggests that with too little relevant knowledge, instruction-first is better.
  - In the earliest months (foundational math, grammar), default to **instruction → practice (I-PS)**.
  - Introduce PS-I for new concepts that build on concepts already mastered.
- The adult-vs-child difference cuts in favor of PS-I for adults, because the reversal was for young children. Whether it holds for adults with **near-zero domain knowledge** is unknown.

### Gaps
- I recall, but could not verify, the unadjusted overall effect (roughly g ≈ 0.36) and the effects split by knowledge type (conceptual vs procedural vs transfer). The full text was not accessible.
- I did not retrieve Kapur's original 2008 study (*Cognition and Instruction*; Singapore 11th graders, physics, ill-structured vs well-structured problems) or check its details.
- No PF study gives an "optimal success rate" for the generation phase. The construct is "failure to produce the canonical solution."

---

## Q5. Motivation and difficulty: adaptive-practice experiments, flow, and self-efficacy

### Takeaway
**EMPIRICAL (large field/online studies):** the evidence on motivation **conflicts by setting**, and the conflict matters for this learner.
- **Math Garden, Dutch children (Jansen et al. 2013):** the **easiest condition (~90% success)** led to **more problems attempted and larger gains**. Learning was mediated by practice volume.
- **Adaptive geography practice online (Papoušek, Stanislav & Pelánek 2016):** easier questions helped **short-term** engagement, while harder questions helped **long-term return rates and learning**.
- **Large educational-game studies (Lomas et al. 2013):** **easier = longer play** (a roughly linear relationship, not an inverted U). An inverted U appeared only for high-expertise players or when players self-selected difficulty.
- **Self-efficacy research:** mastery experiences on **proximal, achievable subgoals** most strongly build persistence, especially for low achievers.

### Cited Findings
**Jansen et al. (2013) Math Garden success-rate experiment (children, school-based, adaptive web practice)**
- Jansen, B. R. J., Louwerse, J., Straatemeier, M., Van der Ven, S. H. G., Klinkenberg, S., & Van der Maas, H. L. J. (2013). The influence of experiencing success in math on math anxiety, perceived math competence, and math performance. *Learning and Individual Differences*, 24, 190–197. DOI 10.1016/j.lindif.2013.09.003. Author lists differ across records; some include Hofman. [V]
- **Design:** 207 children in grades 3–6, split into a control and **three experimental conditions** with different **pre-set success rates**. Each condition used the adaptive program for **six weeks**. — [UvA DARE record](https://dare.uva.nl/id/789fc422-4935-49ca-bcba-803239522951) [V]
- **The three levels were ~60% (difficult), 75% (medium) and 90% (easy).** Corroborated by a technical report from the Pelánek group, which describes the experiment with 60/75/90% conditions and reports "the easiest condition led to the best learning (**mediated by a number of solved tasks**)." — [FI MU technical report FIMU-RS-2016-02](https://www.fi.muni.cz/reports/files/2016/FIMU-RS-2016-02.pdf) [V via snippet]
- **Results:** [V] — [UvA DARE](https://dare.uva.nl/id/789fc422-4935-49ca-bcba-803239522951); [EJ1110268 review](https://files.eric.ed.gov/fulltext/EJ1110268.pdf)
  - Math anxiety improved similarly in all conditions.
  - Perceived competence improved only modestly.
  - **Math performance improved only in the experimental conditions.**
  - **"The higher the pre-set success rate, the more problems children attempted and the larger their performance gains."**
- **Follow-up: Jansen, Hofman, Savi, Visser & van der Maas (2016)**, "Self-adapting the success rate when practicing math," *Learning and Individual Differences*, 51, 1–10. Data from **40,329 children, grades 1–6**. Letting children choose their own difficulty level produced **no clear benefits** for amount of practice, math skill, or self-belief. — [UvA DARE](https://dare.uva.nl/id/04551dd7-7f4e-481f-a544-dac96a5a4bd3) [V]

**Papoušek, Stanislav & Pelánek (2016), ITS conference (web users of an adaptive geography-facts system; mixed ages, voluntary use)**
- "Impact of Question Difficulty on Engagement and Learning." A randomized online experiment with **target error rates of 5%, 20%, 35% and 50%** (i.e., target success 95/80/65/50%). [V] — [paper PDF](https://www.fi.muni.cz/~xpelanek/publications/its-target-difficulty.pdf)
  - "**easy questions are better for short term engagement, whereas difficult questions are better for long term engagement and learning**."
  - "The return rate increases with the difficulty of questions."
- Same group (EDM 2014): "**50% success rate is rather low and for most students it would decrease motivation**. Therefore, it is better to aim for a higher success rate." — [EDM 2014 proceedings](https://files.eric.ed.gov/fulltext/ED558339.pdf) [V]
- Context: the system's difficulty control includes adjusting the number of multiple-choice options, and the users are voluntary web learners. — [Elo-based learner modeling, UMUAI](https://link.springer.com/article/10.1007/s11257-016-9185-7) [V for the system's existence; option-count detail is R]

**Lomas, Patel, Forlizzi & Koedinger (2013), CHI (educational game Battleship Numberline; large-scale online)**
- "Optimizing challenge in an educational game using large-scale design experiments," CHI '13, pp. 89–98. DOI 10.1145/2470654.2470668. Tested the **inverted-U hypothesis** of challenge using **69,642 play sessions**. [V] — [ACM DL](https://dl.acm.org/doi/10.1145/2470654.2470668); [CMU PDF](https://pact.cs.cmu.edu/pubs/Lomas,%20Forlizzi%20&%20Koedinger%202013.pdf)
- Finding: "players are likely to **play for longer as the predicted success rate increases and challenge decreases**." Low challenge did not appear to hurt engagement. The inverted U appeared for players with high expertise. — [ResearchGate figure](https://researchgate.net/figure/Plotting-the-effects-of-challenge-predicted-success-rate-on-player-engagement-Graph_fig8_262350490) [V via snippet]
- Later work describes Lomas's result as **a linear relation: the easier the game, the longer people played**. A follow-up showed an inverted U **only when players consciously self-selected difficulty**. — [Pre-registered study (PMC9890114)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9890114/) [V via snippet]
- "Is Difficulty Overrated?" (Lomas et al., same group) argues difficulty and novelty/suspense were conflated in earlier challenge theories. — [ResearchGate](https://www.researchgate.net/publication/313477156_Is_Difficulty_Overrated_The_Effects_of_Choice_Novelty_and_Suspense_on_Intrinsic_Motivation_in_Educational_Games) [V]

**Flow / difficulty–skill balance**
- A pre-registered study using AI-controlled difficulty is titled "**Difficulty-skill balance does not affect engagement and enjoyment**." It is evidence against a strong reading of flow theory's balance requirement, at least for games. — [PMC9890114](https://pmc.ncbi.nlm.nih.gov/articles/PMC9890114/); [ResearchGate](https://www.researchgate.net/publication/368388414_Difficulty-skill_balance_does_not_affect_engagement_and_enjoyment_a_pre-registered_study_using_artificial_intelligence-controlled_difficulty) [V for title/claim]
- A competing Imperial College study is titled "Objective Difficulty-Skill Balance Impacts Perceived…" (title truncated in search). — [Spiral](https://spiral.imperial.ac.uk/server/api/core/bitstreams/e21a18de-baad-40a1-8c5a-e78733140a45/content) [V for existence only]

**Self-efficacy (Bandura / Schunk)**
- **Bandura & Schunk (1981)**, *Journal of Personality and Social Psychology*, 41(3), 586–598. Children **with gross math (subtraction) deficits** were assigned to **proximal subgoals**, a **distal goal**, or **no goals** during self-directed learning. Proximal subgoals produced the **largest gains in self-efficacy, math skill and intrinsic interest**. Stronger self-efficacy predicted longer persistence. [V; correlations based on small samples, e.g. r(8)] — [JPSP PDF](https://uploads-ssl.webflow.com/59faaf5b01b9500001e95457/5bc552d85141987915dab842_Bandura%20&%20Schunk,%201981.pdf); [UNCG copy](https://libres.uncg.edu/ir/uncg/f/D_Schunk_Cultivating_1981.pdf)
- **Schunk (1990)**, "Goal setting and self-efficacy during self-regulated learning," *Educational Psychologist*: "Proximal goals are especially influential with young children, who do not represent distant outcomes in thought." — [UNCG PDF](https://libres.uncg.edu/ir/uncg/f/D_Schunk_Goal_1990.pdf) [V]
- Mastery experiences are the most influential source of self-efficacy. — [Simply Psychology (secondary)](https://www.simplypsychology.org/self-efficacy.html) [V, secondary]
- **Motivation–achievement cycles:** a 2021 *Educational Psychology Review* literature review on reciprocal links between motivation and achievement. — [EPR 2021](https://link.springer.com/article/10.1007/s10648-021-09616-7) [V that it exists; content not read]

### Inferences
- **The Jansen vs Pelánek conflict is reconcilable:**
  - Jansen's learners were children doing *assigned* school practice, where more items attempted meant more learning. Practice volume was the mediator.
  - Pelánek's were voluntary web users of a facts system. For them the harder condition (≤80% success) produced more learning and more *returning*, possibly through novelty and challenge.
  - A self-studying adult is a voluntary user whose **total practice volume over ~2 years** is the critical variable. Both findings point to the same rule: **keep success high enough that sessions don't end in discouragement, but not so high that items become trivial.**
- For a near-zero, possibly low-confidence adult, the self-efficacy literature argues for a phased approach. Early on, use **short, proximal sets with high success (≈85–90%)** to bank mastery experiences. Then move toward 75–85% as confidence and skill grow.
- **Don't let the learner freely choose difficulty as the main mechanism.** Self-selection gave no benefit in Math Garden (40k children). Use an adaptive or rule-based difficulty controller instead, perhaps with a limited "challenge mode" option.

### Gaps
- I could not retrieve per-condition effect sizes or problems-attempted counts from Jansen et al. (2013), or exact retention and return rates from Papoušek et al. (2016).
- Nearly all success-rate × motivation experiments involve **children or general web users**. I found **no experiment manipulating target success rate for adult exam-preparers**.
- I did not find a flow-theory meta-analysis that links challenge–skill balance to *learning outcomes* (as opposed to enjoyment).

---

## Q6. Different optimal success rates for (a) initial acquisition, (b) consolidation, (c) retrieval/test practice, (d) exam simulation?

### Takeaway
There is no single study comparing optimal accuracy across these phases. The pieces support a **phase-dependent** picture:
- **(a) Acquisition:** high-guidance practice at **~80%** (Rosenshine's classroom-derived heuristic), or brief low-success exploration only if instruction follows.
- **(b) Consolidation:** **~75–90%** (adaptive-practice evidence).
- **(c) Retrieval practice:** **without feedback**, initial success must be well above 50% (testing effect ≈ 0 at ≤50%, g ≈ 0.56 above 75%). **With feedback**, failed retrieval attempts also help.
- **(d) Exam simulation:** **no evidence** on an optimal success rate. Its purpose is calibration and stamina, so its difficulty should match the real exam.

### Cited Findings
**(a) Initial acquisition / guided practice**
- **Rosenshine (2012)**, "Principles of Instruction," *American Educator*. "The research suggests that **the optimal success rate for fostering student achievement appears to be about 80 per cent**." Also: "In order for students to learn new material, they must be successful approximately 80 percent of the time **during guided practice**." Below that, students risk practicing errors. The figure comes from classroom process–product studies (K-12), not experiments. — [Jamie Clark summary quoting Rosenshine](https://newsletter.jamieleeclark.com/p/obtain-a-high-success-rate); [Tips for Teachers](https://tipsforteachers.co.uk/research-rosenshines-principles-of-instruction/); [Structural Learning](https://www.structural-learning.com/post/rosenshines-principles-a-teachers-guide) [V via secondary sources; primary article at aft.org not opened]
- Secondary sources disagree on how the 80% was derived. One says it came from classroom studies where the most effective lessons had ~80% correct responses. Another calls it an informal benchmark. — [Structural Learning](https://www.structural-learning.com/post/rosenshines-principles-a-teachers-guide); [Third Space Learning](https://thirdspacelearning.com/blog/rosenshine-principles/) [V]
- Productive failure (Q4): low-success exploration *before* instruction helps conceptual learning, but not for young learners or domain-general skills. — [X-MOL abstract of Sinha & Kapur 2021](https://www.x-mol.com/paper/1406031499744456704) [V]

**(b) Consolidation / adaptive practice**
- Math Garden: the 90% condition beat 75% and 60% for practice volume and gains, in children. — [FI MU report](https://www.fi.muni.cz/reports/files/2016/FIMU-RS-2016-02.pdf); [UvA DARE](https://dare.uva.nl/id/789fc422-4935-49ca-bcba-803239522951) [V]
- Geography facts: 50–65% success beat 95% for learning and long-term return; 95% was best for short-term engagement. — [Papoušek et al. 2016](https://www.fi.muni.cz/~xpelanek/publications/its-target-difficulty.pdf) [V]

**(c) Retrieval / test practice**
- **Rowland (2014)**, *Psychological Bulletin*, 140, 1432–1463. DOI 10.1037/a0037559. Meta-analysis of testing vs restudy: **61 studies, overall g ≈ 0.50**. Effects were larger **with feedback (g ≈ 0.73) than without (g ≈ 0.39)**. — [Google Scholar lookup](https://scholar.google.com/scholar_lookup?title=The+effect+of+testing+versus+restudy+on+retention:+A+meta-analytic+review+of+the+testing+effect&author=C.+A.+Rowland&publication_year=2014&journal=Psychological+Bulletin&doi=10.1037/a0037559); [Frontiers 2018 review citing Rowland](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2018.02412/full) [V via secondary]
- **Initial-success moderator:** Rowland found **no testing effect for lab experiments without corrective feedback when initial retrieval success was ≤50%**. The third-party figures are **g ≈ 0.03 at ≤50% vs g ≈ 0.56 above 75%**, without feedback. This fits the "bifurcation model": the advantage of testing without feedback over restudy depends on how many items are successfully retrieved. — [Frontiers 2018](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2018.02412/full); [Journal of Cognition (pretesting)](https://journalofcognition.org/articles/455/files/687f6aa6dcf5d.pdf) [V; the exact g values come from a third-party site and should be checked against the paper]
- **Kornell, Klein & Rawson (2015)**, *JEP: Learning, Memory, and Cognition*, 41(1), 283–294: "**Retrieval attempts enhance learning, but retrieval success (versus failure) does not matter**." When feedback follows, the attempt itself produces the benefit, whether or not it succeeds. — [citation listing](https://scrapbox.io/hitorigakusai/思い出し効果) [V title/venue; R for methods]
- **Vaughn, Hausman & Kornell (2016):** giving more retrieval time **raised initial retrieval success but did not significantly improve final test performance**. Higher practice accuracy is not the goal in itself. — [UCSC PDF](https://hausman.sites.ucsc.edu/files/2023/02/Vaughn.Hausman.Kornell.2016.pdf) [V via snippet]
- **Eglington & Pavlik (2020)**, *npj Science of Learning*, 5:15. DOI 10.1038/s41539-020-00074-4. A model-based scheduler practices each item when its predicted recall probability is closest to a target "optimal difficulty" threshold. It argues "**the time cost of practice at these probabilities needs to be considered**," because failed retrievals cost more time (feedback, restudy). Builds on Pavlik & Anderson (2008, *JEP: Applied*). — [npj article](https://www.nature.com/articles/s41539-020-00074-4); [Pavlik & Anderson 2008, PubMed](https://pubmed.ncbi.nlm.nih.gov/18590367/) [V for framing; specific optimal thresholds not retrieved]
- **Schuetze et al. (2022)**, *Cognitive Science*, "Optimal Learning Under Time Constraints: Empirical and Simulated Trade-offs Between Depth and Breadth of Study." A higher retrieval-failure rate can make low-depth, high-breadth study less efficient. — [Wiley](https://onlinelibrary.wiley.com/doi/10.1111/cogs.13136) [V via citing snippet]

**(d) Exam simulation**
- I found **no peer-reviewed study on an optimal success rate for full-length exam simulations**. Exam simulation is supported only indirectly, through transfer-appropriate practice and test familiarity. — [no source found]

### Inferences
- **(c) is the clearest evidence-based rule for practice exams:**
  - Every practice item **must be followed by immediate, explanatory feedback**. Feedback removes the ≥50% success requirement and raises the testing effect (g 0.73 vs 0.39).
  - If any practice mode gives **no feedback** (e.g., a timed mock with answers revealed later), aim for **>75% initial success**. Otherwise testing may give little benefit over restudy.
- **Time efficiency (Eglington & Pavlik):** wrong answers cost extra time (explanation, re-study). Very low-success practice is *time-inefficient* even when each attempt is useful. This pushes practice targets up toward 70–85%, not down toward 50%.
- **Exam simulation (d)** serves calibration, timing, stamina and test strategy. It should mirror real CSAT difficulty even if the learner scores low. Use it sparingly while the learner's subject-level practice accuracy is low, and treat the score as diagnostic, not as practice.

### Gaps
- Rowland's per-band g values (≤50%, 51–75%, >75%) could not be verified against the original.
- Rosenshine's recommended success rate for *independent* practice (often quoted as higher than 80%, e.g. 90–100%) and Brophy & Good (1986) were not verified this session.
- No study compares optimal accuracy across acquisition, consolidation, retrieval and simulation within one design.

---

## Q7. What do these findings imply as concrete target accuracy bands for a struggling or novice adult learner? (ALL EXTRAPOLATED)

### Takeaway
Combining the evidence, a defensible default is: **build in a ~75–85% rolling accuracy band for adaptive practice**, with:
- a **higher band (~85–90%) early on and for discouraged learners**, to build self-efficacy and practice volume;
- deliberate, small doses of **low-success challenge items (<50%)** only when **immediate explanation** follows;
- **real-difficulty exam simulations** treated as diagnostics.

No study validates these exact bands for adult CSAT preparation. They are synthesized heuristics.

### Cited Findings
- 85% is optimal for gradient learners with Gaussian noise; heavier-tailed noise lowers the optimum to 75–82%. — [Wilson et al. 2019](https://www.nature.com/articles/s41467-019-12552-4) [V]
- About 80% success during guided practice is the classroom-derived optimum. — [Rosenshine via Jamie Clark](https://newsletter.jamieleeclark.com/p/obtain-a-high-success-rate) [V, secondary]
- A 90% target gave more practice and larger gains than 75% or 60% for children. — [FI MU report](https://www.fi.muni.cz/reports/files/2016/FIMU-RS-2016-02.pdf) [V]
- A 50% target "would decrease motivation" for most students. — [EDM 2014](https://files.eric.ed.gov/fulltext/ED558339.pdf) [V]
- Lower success (50–80%) gave better long-term learning and return in a voluntary web system. — [Papoušek et al. 2016](https://www.fi.muni.cz/~xpelanek/publications/its-target-difficulty.pdf) [V]
- Without feedback, initial success of ≤50% removes the testing effect. — [Frontiers 2018](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2018.02412/full) [V, secondary]
- Difficulties become undesirable when the learner lacks the knowledge to respond. — [Chen et al. 2018](https://public-pages-files-2025.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2018.01483/text) [V]

### Inferences (proposed rules for building practice exams, all extrapolated)

| Practice mode | Target accuracy (rolling) | Main evidence | Notes |
|---|---|---|---|
| **Brand-new concept, guided** (worked example → similar item) | **~80% (75–85%)** | Rosenshine; Wilson; Chen et al. | Below ~70%: add worked examples or prerequisites; this is likely undesirable difficulty |
| **Early-phase confidence building** (first weeks or after a slump) | **~85–90%** | Jansen 2013; Bandura & Schunk 1981 | Short sets with proximal goals (e.g., 10 items/session); maximize volume and mastery experiences |
| **Standard consolidation / adaptive drill** | **~75–85%** | Wilson; Pelánek; Math Garden default (R) | Raise difficulty when >90% over the last ~20 items; lower it when <65–70% |
| **Spaced retrieval review** (mixed earlier units) | **~70–85%, with feedback** | Rowland 2014; Kornell et al. 2015 | Lower accuracy is acceptable because spacing and interleaving are desirable difficulties; always show the explanation |
| **Retrieval with no immediate feedback** | **>75%** | Rowland 2014 moderator | Below 50% without feedback ≈ no testing benefit |
| **Challenge / preview items** (productive failure) | **<50% expected; ≤10–20% of items** | Sinha & Kapur 2021; Kapur 2016 | Must be followed by a full explanation; don't count toward the learner's "score"; avoid for concepts without prerequisites |
| **Full CSAT-format simulation** | **Whatever real difficulty yields** (expect low early) | No direct evidence | Purpose is diagnosis, timing, stamina; low frequency early; score feeds the difficulty controller |

**Further rules**
- **Correct for guessing on 5-option MCQ.** Observed accuracy overstates mastery: true ≈ (obs − 0.2)/0.8. A 75% observed rate ≈ 69% "known." Short-answer items (주관식 in math) have no guessing floor.
- **Track accuracy by unit or skill, not only overall.** RPL implies selecting items at each skill's edge. A 25% unit and a 95% unit averaging 60% is a mis-targeted set.
- **Order within a learning set:** almost-known items first, then harder ones (RPL). Interleave types only after each type reaches about 70–80% when practiced in isolation (Chen et al. boundary on interleaving for novices; my inference).
- **Feedback is non-negotiable.** It is the single moderator that makes errors useful (Rowland; Kornell et al. 2015).
- **Don't chase 100%.** Consistently ≥95% accuracy signals items below the RPL. Space those items out or retire them.

### Gaps
- None of these bands were tested on adults preparing for a high-stakes exam from near-zero knowledge. The closest populations are Dutch children (Math Garden), Czech/web users (geography), US K-12 game players (Lomas), and adult undergraduates in lab vocabulary studies (Metcalfe, Kornell).
- The Math Garden default target of 0.75 (Klinkenberg et al. 2011, *Computers & Education*) is recalled, not verified.
- No study found compares fixed-band targets against fully model-based schedulers (e.g., Eglington & Pavlik) for complex problem-solving subjects like CSAT math.
