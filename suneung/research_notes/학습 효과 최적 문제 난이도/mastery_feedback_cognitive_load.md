# Mastery Thresholds, Feedback & Error Analysis (오답), and Cognitive Load / Worked Examples: Evidence for Difficulty Adjustment for an Adult Near-Zero-Background 2028 수능 Learner

Grading legend, used on every finding:
- **Evidence grade:** [A] meta-analysis or systematic review · [B] randomized/controlled primary experiment(s) · [C] conference paper, simulation, small or non-randomized study · [D] theory, narrative review, or expert guideline.
- **Verification:** ✔ = checked this session against an abstract or index record (search result or publisher/repository record). ◇ = taken from the researcher's prior knowledge of the literature. For ◇ items the DOI is given, but the text was **not** re-fetched this session (typeset.io, gwern.net and upenn.edu were blocked by the sandbox network), so the report writer should treat ◇ numbers as "very likely correct, verify before quoting precisely."
- **Population/domain tags:** (K-12), (college/adult), (math), (verbal), etc.

---

## Q1. Classic mastery learning (Bloom, Kulik et al., Guskey, Slavin): what mastery thresholds are used, and what evidence supports them?

### Takeaway
Group-based and self-paced mastery learning (teach → formative test → correctives → parallel re-test, advancing only past a criterion) reliably raises unit-test scores by about 0.5 SD. The gain is largest for weaker students but much smaller on standardized or long-term measures. The usual 80–90% cutoff comes from convention and practice, not from strong comparative evidence. The few studies that compared criterion levels directly found ~75–80% to be about as good as higher criteria for achievement, and better for attitude.

### Cited Findings
- **Bloom's "Learning for Mastery" (1968).** Building on Carroll's model of school learning, Bloom argued that most students (he suggested 90%+) can reach a high achievement level if time and corrective help vary with need. The method: short units, a formative test, correctives, then a second formative test before moving on. [D, ◇] — [Bloom 1968, *Evaluation Comment* 1(2), ERIC ED053419](https://eric.ed.gov/?id=ED053419)
- **Bloom (1984), the "2 sigma problem".** One-to-one tutoring combined with mastery-style correctives put the average tutored student about 2 SD above conventional instruction (≈98th percentile). Group mastery learning gave about 1 SD (≈84th percentile). The evidence was mainly two doctoral dissertations (Anania; Burke) with grade 4/5/8 children in short (~3-week) units. [C/D, ◇] — [Bloom 1984, *Educational Researcher* 13(6):4–16, doi:10.3102/0013189X013006004](https://doi.org/10.3102/0013189X013006004)
- **The 2-sigma figure has not held up at scale.** VanLehn's review found human tutoring d≈0.79 (not 2.0), step-based intelligent tutoring systems d≈0.76, and answer-only computer tutoring d≈0.31. In other words, feedback at the level of each step, not just the final answer, delivers most of tutoring's benefit. [A, ◇] (mostly K-12/college; math/physics) — [VanLehn 2011, *Educational Psychologist* 46(4):197–221, doi:10.1080/00461520.2011.611369](https://doi.org/10.1080/00461520.2011.611369)
- **Kulik, Kulik & Bangert-Drowns (1990)** meta-analysed 108 controlled evaluations of Learning for Mastery (LFM) and Keller's Personalized System of Instruction (PSI). They found positive effects on exam performance in colleges, high schools and upper elementary grades. [A, ✔] — [RER 60(2):265–299, doi:10.3102/00346543060002265](https://doi.org/10.3102/00346543060002265); [index record](https://www.academia.edu/81783373/Effectiveness_of_Mastery_Learning_Programs_A_Meta_Analysis)
  - Mean ES on exam scores ≈ **0.52 SD**, per a secondary summary that I could not check against the original. [A, ✔ secondary] — [educaixa technical appendix](https://educaixa.org/es/-/apendice-tecnico-mastery-learning)
  - Gains were larger for low-aptitude than high-aptitude students. [A, ✔ secondary] — [Great Hearts Institute summary](https://institute.greatheartsamerica.org/media/scholarship-and-research/research-on-mastery-learning-including-a-comparison-of-the-bloom-model-and-the-fwtm-model/)
  - The abstract also reports better attitudes toward the course, but more time spent on instruction, and lower completion rates for self-paced (PSI) college courses. [A, ◇] — [doi:10.3102/00346543060002265](https://doi.org/10.3102/00346543060002265)
- **Slavin (1987), the main criticism.** Slavin ran a "best-evidence synthesis" restricted to group-based LFM in elementary/secondary schools, using studies of at least 4 weeks. He concluded that mastery learning was far less impressive in realistic settings than Bloom claimed. [A, ✔] — [Slavin 1987, RER 57(2):175–213, doi:10.3102/00346543057002175](https://doi.org/10.3102/00346543057002175); [scope summary](https://scholarhub.vn/publication/Mastery-Learning-Reconsidered/a191946f-6dba-4049-88c4-ee8ded3a8158)
  - Effects on standardized achievement tests were about zero (median ES ≈ 0.04). Effects on experimenter-made tests were moderately positive, and shrank in longer studies. [◇] — [doi:10.3102/00346543057002175](https://doi.org/10.3102/00346543057002175)
  - Kulik et al. recomputed Slavin's 17 studies and found a median of **+0.25 SD**. They also argued that Slavin's selection criteria excluded relevant studies. [✔ secondary] — [Kulik et al. 1990 via academia.edu record](https://www.academia.edu/81783373/Effectiveness_of_Mastery_Learning_Programs_A_Meta_Analysis)
- **Guskey's formulation.** Mastery learning = formative assessment → individualized correctives (and enrichment for those who pass) → a second, parallel formative assessment. The second assessment checks that the correctives worked and gives a second chance at success. Guskey reports typical mastery standards of about 80–90% correct on the formative test. [D, ◇] — [Guskey 2007, *Journal of Advanced Academics* 19(1):8–31, doi:10.4219/jaa-2007-704](https://doi.org/10.4219/jaa-2007-704)
- **Direct comparison of criterion levels (a single small study).** A Michigan State dissertation (D'Albro) compared criterion levels in mastery classes. A higher criterion, or one that was gradually raised, did not produce higher achievement than a lower one. An **80% fixed criterion** gave the best learning while keeping student attitudes most productive. [C, ✔] — [D'Albro dissertation, MSU](https://d.lib.msu.edu/etd/25195/FULL_TEXT/view)
- **Affective outcomes.** A synthesis of mastery learning's affective effects found that programs with a **criterion ≥75%** had positive affective impact and those below 75% did not. [A, ✔ snippet] — [Tazkiya journal synthesis](https://journal.uinjkt.ac.id/index.php/tazkiya/article/view/9176)
- **Practice difficulty is a separate question from the mastery gate.** For gradient-descent-type learners, a theoretical/simulation paper derived an optimal training error rate of ~15.9% (the "85% rule"). That is about how hard practice items should be, not when to advance a unit. [C/D, ◇] — [Wilson, Shenhav, Straccia & Cohen 2019, *Nature Communications* 10:4646, doi:10.1038/s41467-019-12552-4](https://doi.org/10.1038/s41467-019-12552-4)
- **Learning vs performance.** Accuracy during or right after practice is a poor index of durable learning. Delayed tests are needed to judge learning. [D/A, ◇] — [Soderstrom & Bjork 2015, *Perspectives on Psychological Science* 10(2):176–199, doi:10.1177/1745691615569000](https://doi.org/10.1177/1745691615569000)

### Inferences
- The 80–90% band is a defensible gate. Below ~75%, the affective benefit disappears. Above ~90%, the only evidence (D'Albro) shows no extra achievement and costs extra time, which is Slavin's "time–achievement trade-off."
- For an adult with ~2 years until the 2028 수능, mastery learning's main risk is coverage loss: getting stuck on units. A cap on corrective cycles (e.g., after 2 failed re-tests, move on and schedule spaced revisits) protects coverage. This is a synthesis inference, not something tested directly.
- Kulik's finding that weaker students gain most supports using mastery gating for this learner. Slavin's finding of ≈0 on standardized tests warns that unit tests built from the same item types inflate apparent mastery. The gate should use new (transfer) items in 수능 format, plus a delayed re-check.
- Bloom's 2-sigma figure should not be used to promise outcomes. VanLehn's ~0.8 SD for step-level tutoring is the more realistic ceiling for a well-built adaptive system.

### Gaps
- I could not access the Kulik 1990 full text, so I could not confirm whether "level of mastery criterion" (e.g., 100% vs 80%) was a significant moderator, or its exact sizes. Older summaries sometimes say higher criteria gave larger effects; treat that as unverified.
- Exact details of the mastery standards in Bloom's 1984 source studies (Anania, Burke) were not verified.
- Nearly all of this evidence is from K-12 children or college students in the 1970s–80s. I found no mastery-criterion studies on adults studying for a national entrance exam alone.

---

## Q2. Computational mastery criteria: BKT p(known) ≥ 0.95, "N correct in a row" (ASSISTments/Khan Academy), moving averages. What does the evidence say?

### Takeaway
Bayesian Knowledge Tracing (BKT) traditionally declares mastery at p(L) ≥ 0.95. ASSISTments "skill builders" use 3 consecutive correct (3-CCR). Head-to-head work shows the choice of data and of threshold matters more than the modelling technique. 3-CCR is adequate in ASSISTments trials, but higher N predicts transfer better. A simple exponential moving average (EMA) is a robust, easy-to-tune criterion that tolerates occasional slips.

### Cited Findings
- **Corbett & Anderson (1995)** introduced BKT in the ACT Programming Tutor. It has four parameters per skill: initial knowledge p(L0), learning rate p(T), guess p(G) and slip p(S). The tutor gave practice until p(known) ≥ **0.95**. [B/C, ◇] (college; programming) — [*User Modeling and User-Adapted Interaction* 4:253–278, doi:10.1007/BF01099821](https://doi.org/10.1007/BF01099821)
- **Kelly, Wang, Thompson & Heffernan (2015)** compared knowledge tracing (KT) with N-consecutive-correct (N-CCR) in ASSISTments (K-12 math). [C, ✔] — [EDM 2015 poster pp. 630–631](https://www.educationaldatamining.org/EDM2015/proceedings/poster630-631.pdf); [abstract page](https://sites.google.com/view/drkimkelly/matrix/defining-mastery)
  - KT gave a more stringent mastery threshold, while N-CCR was more accurate.
  - A randomized trial varied N, with performance on a transfer item as the outcome. **3-CCR gave adequate practice**, especially for students who reached it without any error.
  - Higher N-CCR thresholds predicted transfer performance more accurately than lower N or KT.
- **N-CCR can be optimal under BKT.** A 2020 paper (Doroudi, "Mastery learning heuristics and their hidden models", AIED 2020; author and title ◇) shows that N-CCR is the optimal mastery policy for certain BKT models, such as those used by ASSISTments. In that sense, "N in a row" is BKT with implicit parameters. [C, ✔ snippet] — [doi:10.1007/978-3-030-52240-7_16](https://doi.org/10.1007/978-3-030-52240-7_16)
- **Limitation of N-CCR.** A 2025 EDM short paper on BKT thresholds (Baker group) notes that consecutive-correct counting cannot account for haphazard mistakes (slips). [C, ✔ snippet] — [EDM 2025 short paper 4](https://educationaldatamining.org/EDM2025/proceedings/2025.EDM.short-papers.4/index.html)
- **Pelánek & Řihák (2017)** analysed mastery criteria for a single well-specified knowledge component, using both simulated and real data. [C, ✔] — [UMAP 2017 pp. 156–163, doi:10.1145/3079628.3079667](https://doi.org/10.1145/3079628.3079667)
  - "The choice of data sources used for mastery decision and setting of thresholds are more important than the choice of a learner modeling technique."
  - A **simple exponential moving average** is a suitable mastery criterion, and they propose ways to choose its threshold.
- **Pelánek & Řihák (2018), journal extension.** Extends the EMA criterion to account for response time (time intensity) and reports deployment in a widely used system. [C, ✔] — [*New Review of Hypermedia and Multimedia* 24(3):133–159, doi:10.1080/13614568.2018.1476596](https://doi.org/10.1080/13614568.2018.1476596)

### Inferences
- **My own binomial and run-length calculations** (Python, this session; not from a source) show why both the threshold and the attempt budget matter:

  | True accuracy p | P(≥8/10) | P(≥9/10) | P(≥17/20) | Expected trials to 3-in-a-row | P(3-in-a-row within 10 tries) | Expected trials to 5-in-a-row |
  |---|---|---|---|---|---|---|
  | 0.50 | 0.055 | 0.011 | 0.001 | 14.0 | 0.51 | 62 |
  | 0.60 | 0.167 | 0.046 | 0.016 | 9.1 | 0.70 | 30 |
  | 0.70 | 0.383 | 0.149 | 0.107 | 6.4 | 0.86 | 16.5 |
  | 0.80 | 0.678 | 0.376 | 0.411 | 4.8 | 0.96 | 10.3 |
  | 0.90 | 0.930 | 0.736 | 0.867 | 3.7 | 0.995 | 6.9 |

  - "3 in a row with unlimited attempts" passes half of coin-flip learners within 10 tries. N=3 is only safe if attempts are capped (ASSISTments-style daily limit) or the run must be reached early.
  - "8/10 correct" separates p=0.6 from p=0.9 learners reasonably well (17% vs 93% pass).
  - "≥17/20" is stricter, but needs 20 items per skill.
  - On 5-option 수능 multiple choice, pure guessing (p≈0.2) gives 3-in-a-row only 0.8% of the time per triple. The real false-positive risk is partial knowledge at p≈0.5–0.7, not blind guessing.
- **Practical gate for this system:** count only unaided first attempts (no hints, no worked-example view). Mastery = **N-CCR with N=3 to 4 reached within ≤8 attempts, AND ≥80% on a 10-item mixed check** (or an EMA ≥ ~0.85–0.9). Higher N, or 5-CCR, for foundational skills that later units depend on (e.g., 다항식 연산, 지수·로그 laws), following Kelly et al.'s finding that higher N predicts transfer better.
- **EMA is attractive for a single adult learner.** Pelánek's 2017 finding means one slip does not reset progress to zero. For example, θ ← 0.8·θ + 0.2·correct, with mastery at θ ≥ 0.9. The α and threshold here are illustrative; they are not values reported by Pelánek.

### Gaps
- Khan Academy's current mastery system ("Familiar / Proficient / Mastered" mastery points) and its history are not documented here. From memory: it used a "10 in a row" streak, then switched to a model-based proficiency estimate around 2011. Neither was verified this session, and neither is peer-reviewed.
- I found no peer-reviewed evidence that 0.95 is optimal. It is a convention from Corbett & Anderson. The 2025 EDM paper on BKT thresholds (Baker group) could not be fetched (host blocked), so its recommended threshold is unknown.
- Common BKT fitting bounds (slip < 0.1, guess < 0.3) are practitioner lore here; not verified.

---

## Q3. Feedback: levels (task/process/self-regulation/self), what type works, and immediate vs delayed

### Takeaway
Feedback has a medium average effect (d≈0.4–0.5) with very high variance. Over a third of feedback interventions *reduce* performance, mainly feedback aimed at the self (praise or ego). The most useful feedback carries information about the task and the process: elaborated feedback explaining why, rather than just right/wrong. Telling the learner only whether they were right is nearly useless (ES≈0.05). Giving the correct answer is moderate (≈0.32). Explanation is best (≈0.49, more for higher-order outcomes). Immediate feedback suits initial, lower-order skill learning. Delayed feedback (e.g., end of set) tends to help retention on multiple-choice tests.

### Cited Findings
- **Hattie & Timperley (2007)** model feedback as answering three questions: Where am I going? How am I going? Where to next? (feed-up / feed-back / feed-forward). [D/A, ◇] — [RER 77(1):81–112, doi:10.3102/003465430298487](https://doi.org/10.3102/003465430298487)
  - Feedback works at four levels: **task** (FT: correctness, information), **process** (FP: strategies to detect errors and relate ideas), **self-regulation** (FR: self-monitoring) and **self** (FS: praise). FP and FR are most powerful for deep learning, FT helps when it feeds into process, and FS is least effective.
  - Reported average effect: d≈0.79, a synthesis of meta-analyses that later work revised downward.
- **Wisniewski, Zierer & Hattie (2020)** meta-analysed 435 studies (≈994 effect sizes, >61,000 participants). [A, ✔] (mostly school-age; mixed domains) — [*Frontiers in Psychology* 10:3087, doi:10.3389/fpsyg.2019.03087](https://doi.org/10.3389/fpsyg.2019.03087); [PMC6987456](https://pmc.ncbi.nlm.nih.gov/articles/PMC6987456)
  - Random-effects mean **d = 0.48**, with significant heterogeneity: "feedback cannot be understood as a single consistent form of treatment."
  - "The information content conveyed" substantially moderates the effect. Effects are larger for cognitive and motor outcomes than for motivational and behavioural ones.
  - Category estimates as I recall them (◇, verify against PMC): high-information feedback d≈0.99, corrective feedback ≈0.46, reinforcement/punishment ≈0.24.
- **Kluger & DeNisi (1996)** pooled 607 effect sizes (~23,663 observations), mostly adults in lab and work settings. [A, ◇] — [*Psychological Bulletin* 119(2):254–284, doi:10.1037/0033-2909.119.2.254](https://doi.org/10.1037/0033-2909.119.2.254)
  - Mean **d≈0.41**, but **more than one-third of feedback interventions decreased performance**.
  - Their Feedback Intervention Theory: effects drop as feedback shifts attention away from the task, toward the self (meta-task) level. Effects rise with feedback about the correct solution or about change from previous trials.
- **Shute (2008)** reviewed formative feedback and gave guidelines. [D, ◇] — [RER 78(1):153–189, doi:10.3102/0034654307313795](https://doi.org/10.3102/0034654307313795)
  - Give elaborated, specific feedback about the task or process, in manageable chunks.
  - Avoid normative comparisons and praise of the person.
  - Use **immediate** feedback for difficult or new tasks, procedural skills and low-achieving learners. Delayed feedback can suit simple tasks, transfer goals and high achievers.
- **Van der Kleij, Feskens & Eggen (2015)** meta-analysed item-based feedback in computer-based environments: 40 studies, 70 ES ranging −0.78 to 2.29. [A, ✔] — [RER 85(4):475–511, doi:10.3102/0034654314564881](https://doi.org/10.3102/0034654314564881); [ACU record](https://acuresearchbank.acu.edu.au/item/86y84/effects-of-feedback-in-a-computer-based-learning-environment-on-students-learning-outcomes-a-meta-analysis)
  - Mean ES by feedback type: elaborated feedback (explanation) **0.49**; correct answer given (KCR) **0.32**; correctness only (KR) **0.05**. The elaborated-feedback advantage was clearest for higher-order outcomes.
  - Effects were **larger in mathematics** than in social science, science or languages.
  - Effects were smaller with delayed timing and in primary or high school (i.e., larger in higher education).
  - Immediate feedback looked better for lower-order and delayed for higher-order outcomes, but this interaction was not significant.
- **Correct-answer feedback is essential.** In word and translation learning (college students), right/wrong feedback alone gave little benefit, while showing the correct answer after an error greatly boosted later recall. Feedback after *correct* answers mattered little. [B, ◇] (adults; verbal) — [Pashler, Cepeda, Wixted & Rohrer 2005, JEP:LMC 31(1):3–8, doi:10.1037/0278-7393.31.1.3](https://doi.org/10.1037/0278-7393.31.1.3)
- **Explanations help transfer.** Explanation feedback beat correct-answer feedback for transfer to new inference questions. [B, ◇] (adults; science text) — [Butler, Godbole & Marsh 2013, *Journal of Educational Psychology* 105(2):290–298, doi:10.1037/a0031026](https://doi.org/10.1037/a0031026)
- **Delayed feedback on multiple-choice tests.** Butler, Karpicke & Roediger (2007) found delayed feedback produced better final cued-recall than immediate feedback, possibly because of spacing. [B, ✔] (college; verbal) — [JEP:Applied 13(4):273–281, doi:10.1037/1076-898X.13.4.273](https://doi.org/10.1037/1076-898X.13.4.273); [WUSTL record](https://profiles.wustl.edu/en/publications/the-effect-of-type-and-timing-of-feedback-on-learning-from-multip/)
- **Exposure-time confound tested.** Smith & Kimball (2010) noted that the delayed conditions in those studies gave longer exposure. With exposure controlled, they still found a delay advantage, even with only a 3-s delay before feedback. [B, ✔] — [Smith & Kimball 2010 manuscript (JEP:LMC 36(1))](https://www.ou.edu/memorylab/pdfs/SmithKimball_2010_LearningFromFeedback_ms.pdf)
- **Kulik & Kulik (1988).** In all but one of the 8 multiple-choice feedback-timing studies they analysed, delayed feedback was better. Earlier response-learning (applied classroom) work favoured immediate feedback, so timing effects depend on the task. [A, ✔ secondary] — [RER 58(1):79–97, doi:10.3102/00346543058001079](https://doi.org/10.3102/00346543058001079); described in [Smith & Kimball 2010](https://www.ou.edu/memorylab/pdfs/SmithKimball_2010_LearningFromFeedback_ms.pdf)
- **Feedback cancels multiple-choice lures.** Feedback after a multiple-choice test removes the "negative testing effect" (learning the wrong lures). [B, ✔ snippet] — [Butler/Roediger-lab MC feedback paper, PMC4094137](https://pmc.ncbi.nlm.nih.gov/articles/PMC4094137)

### Inferences
- **Every wrong answer** should get (a) the correct answer, (b) a step-level or process-level explanation of why (and, for 수능 5-option items, why the chosen distractor is wrong), and (c) a pointer to the sub-skill. Correctness-only marking is close to useless (KR ES≈0.05).
- **Avoid self-level feedback** ("you're smart", streak celebrations as the main message). Feedback text should be task/process/self-regulation focused ("check sign when moving terms"), in line with Kluger & DeNisi and Hattie & Timperley.
- **Timing rule:**
  - During initial skill acquisition (novice, procedural math, new grammar rules): give step-level or immediate feedback, per Shute and VanLehn.
  - During 수능-format multiple-choice practice sets and mock tests: give feedback after the whole set (delayed by minutes to a day), plus a later re-test. This matches exam conditions and the delayed-feedback retention advantage.
- Since Van der Kleij found larger effects in math and in higher education, an adult studying math is where elaborated item feedback should pay off most.

### Gaps
- Wisniewski et al.'s sub-category effect sizes (task/process/self-regulation levels; high-information feedback) are given from memory (◇). Verify in PMC6987456.
- There are few feedback-timing studies specifically on adult self-study for a high-stakes entrance exam, or on Korean-language reading items.

---

## Q4. Learning from errors (오답): hypercorrection, errorful learning, error classification, and error logs / wrong-answer notebooks

### Takeaway
Making errors and then getting corrective feedback helps learning. Confident errors are the easiest to correct (hypercorrection), so confidence ratings help pick which 오답 to prioritise. Classic math-education research distinguishes systematic "bugs" or misconceptions (conceptual), procedural flaws, and slips or careless errors. Only the systematic ones repeat and need re-teaching. Wrong-answer notebooks are widely used in Korea and East Asia, but rigorous causal evidence for them is thin. Their likely active ingredients are retrieval re-testing of corrected items, explanation, and spacing. In math, correct worked examples beat incorrect ones for novices. Finding errors in "erroneous examples" helps more once prior knowledge is higher.

### Cited Findings
- **Butterfield & Metcalfe (2001), hypercorrection.** On general-information questions (adults), errors made with high confidence were more likely to be corrected after feedback than low-confidence errors. [B, ◇] — [JEP:LMC 27(6):1491–1494, doi:10.1037/0278-7393.27.6.1491](https://doi.org/10.1037/0278-7393.27.6.1491)
- **Metcalfe (2017), Annual Review "Learning from Errors".** [D/A, ✔] — [*Annual Review of Psychology* 68:465–489, doi:10.1146/annurev-psych-010416-044022](https://doi.org/10.1146/annurev-psych-010416-044022); [PubMed 27648988](https://pubmed.ncbi.nlm.nih.gov/27648988/)
  - Errorful learning followed by **corrective feedback** benefits learning.
  - Errors made with high confidence are corrected more readily (hypercorrection).
  - Corrective feedback, including analysis of the reasoning that led to the mistake, is crucial.
  - It "may be worthwhile to allow and even encourage students to commit and correct errors while they are in low-stakes learning situations" if the goal is high-stakes performance. Keywords include hypercorrection, the generation effect and prediction error.
- **Failed retrieval attempts help** if followed by feedback: attempting an answer, even unsuccessfully, then seeing it, improved later recall versus just studying. [B, ◇] (adults; verbal) — [Kornell, Hays & Bjork 2009, JEP:LMC 35(4):989–998, doi:10.1037/a0015729](https://doi.org/10.1037/a0015729)
- **Productive failure meta-analysis.** Having learners attempt problems *before* instruction (problem solving then instruction) improved conceptual knowledge and transfer, but not procedural knowledge, especially when well implemented. [A, ◇] (mostly secondary math/science) — [Sinha & Kapur 2021, RER 91(5):761–798, doi:10.3102/00346543211019105](https://doi.org/10.3102/00346543211019105)
- **Radatz (1979)** proposed classifying math errors by cause: language difficulties, spatial/visual information, deficient mastery of prerequisite skills and concepts, incorrect associations or rigid thinking, and applying irrelevant rules or strategies. [D, ◇] — [*Journal for Research in Mathematics Education* 10(3):163–172, doi:10.5951/jresematheduc.10.3.0163](https://doi.org/10.5951/jresematheduc.10.3.0163)
- **Brown & Burton (1978), procedural "bugs".** Many children's subtraction errors come from consistent "bugs" (systematically wrong procedures) that can be diagnosed from patterns across items. Random slips are inconsistent. [C/D, ◇] (children; arithmetic) — [*Cognitive Science* 2(2):155–192, doi:10.1207/s15516709cog0202_4](https://doi.org/10.1207/s15516709cog0202_4)
- **Conceptual vs procedural knowledge develop iteratively.** Each supports the other, so errors can reflect gaps in either. [B, ◇] (children; decimals) — [Rittle-Johnson, Siegler & Alibali 2001, *Journal of Educational Psychology* 93(2):346–362, doi:10.1037/0022-0663.93.2.346](https://doi.org/10.1037/0022-0663.93.2.346)
- **BKT models slips explicitly.** The slip parameter p(S) is the probability that a learner who knows a skill still answers wrong, so a single error should not be read as non-mastery. [B/C, ◇] — [Corbett & Anderson 1995, doi:10.1007/BF01099821](https://doi.org/10.1007/BF01099821)
- **Correct vs incorrect worked examples (Barbieri et al. 2023).** In math, studies using **correct examples alone** had larger effects than those using only incorrect or mixed correct+incorrect examples. [A, ✔] — [Barbieri, Miller-Cotto, Clerjuste & Chawla 2023, *Educational Psychology Review* 35:11, doi:10.1007/s10648-023-09745-1](https://doi.org/10.1007/s10648-023-09745-1)
- **Finding and fixing errors needs prior knowledge.** Asking learners to find and fix errors in worked examples helped those with **high prior knowledge** but not low-prior-knowledge learners. [B, ◇] (university; probability) — [Große & Renkl 2007, *Learning and Instruction* 17(6):612–634, doi:10.1016/j.learninstruc.2007.09.008](https://doi.org/10.1016/j.learninstruc.2007.09.008)
- **Erroneous examples in an online tutor.** Erroneous decimal examples in a web-based tutor improved delayed post-test performance versus supported problem solving for middle-schoolers. [B, ◇] (children; math) — [Adams, McLaren et al. 2014, *Computers in Human Behavior* 36:401–411, doi:10.1016/j.chb.2014.07.032](https://doi.org/10.1016/j.chb.2014.07.032)
- **Wrong-answer notebooks (오답노트): evidence is weak.** I found no randomized controlled trials. [C, ✔]
  - A Philippine STEM study (29 students) had students revisit quiz errors in a "Wrong Answer Note" and reflect on causes such as carelessness. Outcomes were descriptive or perceptual. — [DLSU Research Congress 2019](https://www.dlsu.edu.ph/wp-content/uploads/pdf/conferences/research-congress-proceedings/2019/lli-I-005.pdf); [Reyes thesis, "S.E.R.O. model wrong answer note"](https://animorepository.dlsu.edu.ph/etd_masteral/6295)
  - A Spanish higher-education study found students rated "error analysis sheets" useful, especially those with high math anxiety. Grades correlated with attending sheet sessions, which is correlational, not causal. — [HEAd'22 paper](https://headconf.org/wp-content/uploads/pdfs/14656.pdf); [RiuNet record](https://riunet.upv.es/entities/publication/dd840d14-a3d3-4e19-9f67-bf705578c33a)

### Inferences
- **Error classification for the system's 오답 log.** Four practical classes, each with a different response:
  1. **Slip / careless (실수).** The learner can fix it unaided once told "there's an error in step k", or on immediate re-try. The same skill does not fail again within the next 2–3 items. Response: a light-touch note and a self-check habit prompt. Count it partially (e.g., an EMA dip) rather than resetting mastery to zero.
  2. **Procedural (절차 오류).** A consistent wrong step across ≥2 items of the same type; this is Brown & Burton's "bug." Response: a targeted worked example showing the correct step next to the learner's wrong step, then 2–3 isolated practice items.
  3. **Conceptual (개념 오류 / 오개념).** Wrong across item surface features, or unable to explain why. Often a missing prerequisite (Radatz). Response: drop to the prerequisite unit, then worked example → faded → problems (see Q5).
  4. **Reading / comprehension or strategy (독해·전략 오류).** Common in 국어/영어 and in long 통합과학/통합사회 stems; Radatz's "language difficulties" category. Response: process feedback on reading the stem and the choices.
- **Use confidence.** Ask a 1–3 confidence rating on each item.
  - High-confidence errors get elaborated feedback plus a re-test after a delay (hypercorrection makes these high-yield).
  - Low-confidence correct answers count as "not yet mastered" (possible guesses at 20% on 5-option items).
- Wrong-answer notebooks should be built as **re-test queues**, not copying: hide the answer, re-attempt at spaced intervals, mark "cleared" after 2 correct re-tries on different days. This draws on retrieval and feedback effects from Metcalfe and Kornell et al., not on direct notebook evidence.
- For a **novice**, show correct worked examples first. Introduce "find-the-error" erroneous examples only after basic mastery (Große & Renkl; Barbieri et al.).

### Gaps
- I found no rigorous (RCT) evidence on wrong-answer notebooks, including Korean 오답노트 studies; a Korean-language database search (RISS/KCI) was not done.
- I found no validated base rates for what share of math errors are careless vs conceptual in adult learners. Clements (1982, JRME) studied careless errors in sixth graders, but it was not retrieved.
- Hypercorrection in children and older adults exists in the literature (e.g., Metcalfe & Finn on children) but was not verified this session.

---

## Q5. Cognitive load theory: worked examples → faded examples → independent problems, expertise reversal, and detecting when to remove scaffolding

### Takeaway
For novices on complex (high element interactivity) material, studying worked examples beats unguided problem solving: meta-analytic g≈0.48 in math. Fading steps gradually, removing the last step first (backward fading), smooths the transition to independent problems. Adapting the fade to the individual learner beats fixed fading. As expertise grows, the benefit reverses (expertise reversal): examples become redundant and problem solving becomes better. Expertise can be detected quickly with "first-step" rapid diagnostic items and mental-effort ratings (performance vs effort efficiency).

### Cited Findings
- **Sweller (1988).** Conventional problem solving by means-ends analysis imposes a heavy working-memory load that competes with building schemas (stored patterns of how to solve a problem type), so novices can solve problems without learning much. [B/D, ◇] — [*Cognitive Science* 12(2):257–285, doi:10.1207/s15516709cog1202_4](https://doi.org/10.1207/s15516709cog1202_4)
- **Sweller & Cooper (1985).** Year 9/10 students in algebra who studied worked examples learned faster and made fewer errors on similar problems than students who solved equivalent problems. [B, ◇] (adolescents; algebra) — [*Cognition and Instruction* 2(1):59–89, doi:10.1207/s1532690xci0201_3](https://doi.org/10.1207/s1532690xci0201_3)
- **Cooper & Sweller (1987).** Transfer to dissimilar problems required more examples and more practice time, for schemas and rule automation to develop. [B, ◇] — [*Journal of Educational Psychology* 79(4):347–362, doi:10.1037/0022-0663.79.4.347](https://doi.org/10.1037/0022-0663.79.4.347)
- **Atkinson, Derry, Renkl & Wortham (2000)** reviewed worked-example research and gave design guidelines. [D/A, ◇] — [RER 70(2):181–214, doi:10.3102/00346543070002181](https://doi.org/10.3102/00346543070002181)
  - Within each example: integrate text and diagrams, and mark subgoals.
  - Across examples: use multiple examples per problem type with varied surface features, pair each example with a practice problem, and encourage self-explanation.
- **Renkl & Atkinson (2003)** argued for structuring the transition from example study to problem solving by **fading** worked-out steps. In their studies, backward fading (omit the last step first) tended to work well, and fading improved near transfer. [D/B, ◇] — [*Educational Psychologist* 38(1):15–22, doi:10.1207/S15326985EP3801_3](https://doi.org/10.1207/S15326985EP3801_3)
- **Smooth transitions beat abrupt ones.** A sequence of example → partly faded → problem led to better learning than example–problem pairs. [B, ◇] (college; probability) — [Renkl, Atkinson, Maier & Staley 2002, *Journal of Experimental Education* 70(4):293–315, doi:10.1080/00220970209599510](https://doi.org/10.1080/00220970209599510)
- **Fading plus self-explanation prompts** (e.g., "which principle was used?") improved both near and far transfer. [B, ◇] — [Atkinson, Renkl & Merrill 2003, *Journal of Educational Psychology* 95(4):774–783, doi:10.1037/0022-0663.95.4.774](https://doi.org/10.1037/0022-0663.95.4.774)
- **Salden, Aleven, Schwonke & Renkl (2010), adaptive fading.** One lab and one classroom experiment in a Cognitive Tutor (high-school geometry) both showed better learning with **adaptive fading** (examples faded per student, based on how well they self-explained each step) than with fixed fading or plain tutored problem solving. The conference version reported higher delayed transfer. [B, ✔] — [*Instructional Science* 38(3):289–307, HW research portal record](https://researchportal.hw.ac.uk/en/publications/the-expertise-reversal-effect-and-worked-examples-in-tutored-prob/)
- **Barbieri et al. (2023) meta-analysis**, causal, random-assignment studies in math from elementary to postsecondary, mostly in classrooms. [A, ✔] — [*Educational Psychology Review* 35:11, doi:10.1007/s10648-023-09745-1](https://doi.org/10.1007/s10648-023-09745-1)
  - Average worked-example effect **g = 0.48** (robust variance estimation; earlier posters gave 0.43).
  - The effect was medium whether examples were used for initial skill acquisition or for practice.
  - Correct examples alone beat incorrect or mixed examples.
- **Kalyuga, Ayres, Chandler & Sweller (2003), expertise reversal effect.** Techniques that help novices (worked examples, integrated explanations) can become ineffective or harmful for more knowledgeable learners, because the redundant guidance adds extraneous load. [D/A, ◇] — [*Educational Psychologist* 38(1):23–31, doi:10.1207/S15326985EP3801_4](https://doi.org/10.1207/S15326985EP3801_4)
- **Kalyuga (2007)** reviewed expertise reversal and its implications for learner-tailored instruction, including dynamic tailoring of guidance based on ongoing assessment. [D/A, ◇] — [*Educational Psychology Review* 19(4):509–539, doi:10.1007/s10648-007-9054-3](https://doi.org/10.1007/s10648-007-9054-3)
- **Kalyuga & Sweller (2004), rapid "first-step" diagnostic.** [B, ✔ concept / ◇ numbers] (high school/adult; linear equations) — [*Journal of Educational Psychology* 96(3):558–568, doi:10.1037/0022-0663.96.3.558](https://doi.org/10.1037/0022-0663.96.3.558); [concept summary (Kalyuga chapter)](https://escholarship.org/content/qt0899206c/qt0899206c.pdf)
  - Learners see a problem and must give **the first step they would take**. An expert may jump straight to the final answer; intermediate learners show an early step; novices cannot start. This measures how readily schemas are used, instead of a long test.
  - Per my recall of the paper (◇): rapid-test scores correlated with traditional tests up to r≈0.92, with testing time cut by a factor of ≈4.9. Adapting instruction to rapid-test scores beat non-adapted instruction on linear-equation learning.
- **Kalyuga & Sweller (2005), rapid dynamic assessment.** Combined rapid performance scores with subjective mental-effort ratings into a cognitive efficiency index to adapt e-learning in real time. Learner-adapted sequencing improved efficiency. [B, ✔ record / ◇ details] — [*Educational Technology Research & Development* 53(3):83–93, doi:10.1007/BF02504800](https://doi.org/10.1007/BF02504800)
- **The mental-effort scale and efficiency formula.** Paas (1992) introduced the 9-point subjective mental-effort scale. Paas & van Merriënboer (1993) defined instructional efficiency as E = (z_performance − z_effort)/√2. [B/D, ◇] — [Paas 1992, *Journal of Educational Psychology* 84(4):429–434, doi:10.1037/0022-0663.84.4.429](https://doi.org/10.1037/0022-0663.84.4.429); [Paas & van Merriënboer 1993, *Human Factors* 35(4):737–743, doi:10.1177/001872089303500412](https://doi.org/10.1177/001872089303500412)
- **Worked examples outside math.** They also helped novices in a less-structured verbal domain: essay writing in English literature. [B, ◇] (verbal) — [Kyun, Kalyuga & Sweller 2013, *Journal of Experimental Education* 81(3):385–408, doi:10.1080/00220973.2012.727884](https://doi.org/10.1080/00220973.2012.727884)

### Inferences
- **Default sequence per new skill for this novice:**
  1. 1–2 fully worked examples with subgoal labels and a self-explanation prompt.
  2. An example–problem pair: one example, then an isomorphic problem.
  3. 2–3 backward-faded examples (last step blank, then last two steps).
  4. Independent problems.
- **When to skip or remove scaffolding:** run 2–3 rapid first-step items before teaching a skill (Kalyuga & Sweller 2004).
  - Correct first step or immediate answer on ≥2/3 → skip worked examples and start at faded or independent problems.
  - Mid-solution errors → start at faded examples.
  - Cannot start → full worked examples.
- **During practice, ask a 1–9 mental-effort rating** on some items.
  - High accuracy with low effort (e.g., ≥80% correct and effort ≤4) → fade faster or level up.
  - High effort (≥7) with low accuracy → step back one scaffolding level.
  - This applies Paas's efficiency logic; the specific cutoffs are mine, not from the papers.
- **Expertise reversal means scaffolding must be removed, not just added.** Once a skill is mastered (Q2 gate), stop showing worked solutions by default and offer them only on request after an attempt. Otherwise learning efficiency drops (Kalyuga et al. 2003).
- **Adults with strong general literacy** (e.g., in 국어 reading) may already be beyond "novice" in some sub-skills. Run the rapid diagnostic per subject and sub-skill, not once overall.

### Gaps
- I could not verify the exact Kalyuga & Sweller (2004/2005) statistics (correlation, time savings, effect sizes) this session.
- Worked-example and fading evidence is mostly math, science, programming and probability with secondary or college students. Evidence for 국어/영어 reading comprehension items is sparse; Kyun et al. 2013 is one of few.
- There is no consensus on the exact number of examples before fading. Guidelines say "multiple examples per problem type"; I found no precise optimum.

---

## Q6. Element interactivity as a practical measure of problem difficulty, and how to use it to grade math problems into levels

### Takeaway
In CLT, intrinsic difficulty equals element interactivity: the number of elements (concepts, rules, steps) that must be processed *simultaneously* in working memory. Crucially, what counts as one "element" depends on the learner's existing schemas. Chen, Kalyuga & Sweller showed experimentally that worked examples help with high-interactivity material, while generating answers (problem solving) helps with low-interactivity material or once expertise grows. So element interactivity can serve as both a difficulty grade and a switch for scaffolding.

### Cited Findings
- **Sweller (2010)** defines intrinsic and extraneous load in terms of element interactivity. Material is hard when many elements must be processed together because they interact (e.g., solving an algebraic equation for a variable requires holding several interacting operations); it is easy when elements can be learned one at a time (e.g., vocabulary pairs). Expertise reduces interactivity because schemas chunk many elements into one. [D, ◇] — [*Educational Psychology Review* 22(2):123–138, doi:10.1007/s10648-010-9128-5](https://doi.org/10.1007/s10648-010-9128-5)
- **Sweller & Chandler (1994)** introduced the idea that some material is intrinsically difficult because of high element interactivity, and estimated it by counting the interacting elements a novice must consider. [B/D, ◇] — [*Cognition and Instruction* 12(3):185–233, doi:10.1207/s1532690xci1203_1](https://doi.org/10.1207/s1532690xci1203_1)
- **Chen, Kalyuga & Sweller (2015).** [B, ✔] (school students; geometry) — [*Journal of Educational Psychology* 107(3):689–704, doi:10.1037/edu0000018](https://doi.org/10.1037/edu0000018); [Loughborough repository](https://repository.lboro.ac.uk/articles/journal_contribution/The_worked_example_effect_the_generation_effect_and_element_interactivity/12053721)
  - Experiment 1: a **worked-example effect for high element interactivity** material and a **generation effect for low element interactivity** material.
  - Experiment 2: with rising expertise (which lowers effective complexity), a generation effect appeared for all materials.
  - Conclusion: generating responses helps with low-interactivity material; worked examples are preferable for high-interactivity material.
- **Follow-ups.** With high-school trigonometry learners, a delayed test showed a three-way interaction between guidance, element interactivity and expertise. With Year 6 students, higher guidance helped on high-interactivity information and lower guidance helped on low-interactivity information. [B, ✔ snippet] — [Loughborough repository: "Relations between the worked example and generation effects on immediate and delayed tests"](https://repository.lboro.ac.uk/articles/journal_contribution/Relations_between_the_worked_example_and_generation_effects_on_immediate_and_delayed_tests/12052686); ["When instructional guidance is needed"](https://repository.lboro.ac.uk/articles/journal_contribution/When_instructional_guidance_is_needed/12052683/1)
- **20-year update of CLT.** Element interactivity is the central construct, and the theory has widened to account for learner expertise and working-memory depletion. [D, ◇] — [Sweller, van Merriënboer & Paas 2019, *Educational Psychology Review* 31:261–292, doi:10.1007/s10648-019-09465-5](https://doi.org/10.1007/s10648-019-09465-5)
- **Criticism.** Cognitive load and element interactivity are hard to measure objectively. Element counts depend on the learner and on post-hoc interpretation, and self-reported load scales are of uncertain validity. [D, ◇] — [de Jong 2010, *Instructional Science* 38:105–134, doi:10.1007/s11251-009-9110-0](https://doi.org/10.1007/s11251-009-9110-0)

### Inferences
- **A workable item-difficulty rubric.** My own design, built on Sweller 2010 and Chen et al. 2015; not validated. Count, *for a learner who has mastered only the prerequisites*, the number of distinct concepts, rules or steps that must be coordinated at the same time, plus the number of representation switches (text → equation, graph → algebra):
  - **L1 (1–2 elements):** single-fact recall or a one-rule application (e.g., an exponent law on one term; a vocabulary meaning). Practise by generating answers (retrieval), with no worked example.
  - **L2 (3–4 elements):** a 2–3-step routine procedure within one unit (e.g., solving a linear equation; a basic derivative). Start with one worked example, then problems.
  - **L3 (5–7 elements):** multi-step within a unit, or one representation switch (e.g., setting up from a word problem; reading a graph and computing). Use the full worked → faded → problem sequence.
  - **L4 (8+ elements, or crossing units):** combining two or more units, with case analysis or a non-routine insight; 수능 high-difficulty items such as 21/22/29/30-type math items, or 통합과학 multi-concept data items. Attempt only after L3 mastery in every component skill. Initially give worked examples of whole solutions with subgoal labels, then fade.
- Because expertise collapses elements into chunks, re-score items **relative to the learner's mastered skills**: once a skill passes the Q2 gate, it counts as 1 element. This gives a natural progression, where yesterday's L3 becomes today's L2.
- This rubric also tells the system **when to use worked examples vs plain practice**, per Chen et al. 2015: L1–L2 items, or any item once its components are mastered → generation/problem practice; L3–L4 for a novice → examples first.

### Gaps
- I found no validated, standardized coding manual for counting element interactivity in exam items. Published counts are illustrative, done by the researchers, and depend on the assumed learner.
- I found no study that applied element-interactivity coding to 수능 items or any national-exam item bank. Calibrating against empirical item difficulty (e.g., KICE 정답률 data) would be needed.

---

## Q7. Concrete rules: level-up/level-down thresholds, items per skill to confirm mastery, and careless vs conceptual errors

### Takeaway
Combining the evidence: gate advancement at ~80–90% correct on fresh items, plus a short run of consecutive unaided correct answers, plus a delayed re-check. Step back after repeated failure or high-effort failure. Use roughly 8–10 scored items per skill as the minimum to tell a ~60% learner from a ~90% learner. Treat isolated, self-correctable slips as noise (partial penalty) and repeated, cross-item errors as conceptual (re-teach the prerequisite). These rules are synthesis inferences, and the sources they rest on are listed below.

### Cited Findings
- 80% fixed criterion ≈ best balance of achievement and attitude (single study) [C, ✔] — [D'Albro, MSU](https://d.lib.msu.edu/etd/25195/FULL_TEXT/view). Criterion ≥75% needed for positive affect [A, ✔ snippet] — [Tazkiya synthesis](https://journal.uinjkt.ac.id/index.php/tazkiya/article/view/9176). Typical classroom standard 80–90% [D, ◇] — [Guskey 2007](https://doi.org/10.4219/jaa-2007-704)
- 3-CCR adequate, especially when reached without error; higher N predicts transfer better [C, ✔] — [Kelly et al. 2015](https://www.educationaldatamining.org/EDM2015/proceedings/poster630-631.pdf)
- Threshold and data choice matter more than the model; EMA works well [C, ✔] — [Pelánek & Řihák 2017](https://doi.org/10.1145/3079628.3079667)
- BKT convention p(L) ≥ 0.95, with a slip parameter for careless errors [◇] — [Corbett & Anderson 1995](https://doi.org/10.1007/BF01099821)
- Elaborated feedback ≫ correctness-only feedback [A, ✔] — [Van der Kleij et al. 2015](https://doi.org/10.3102/0034654314564881). Confident errors hypercorrect [✔] — [Metcalfe 2017](https://doi.org/10.1146/annurev-psych-010416-044022)
- Adaptive fading beats fixed fading [B, ✔] — [Salden et al. 2010](https://researchportal.hw.ac.uk/en/publications/the-expertise-reversal-effect-and-worked-examples-in-tutored-prob/). Rapid first-step diagnostics [B, ✔] — [Kalyuga & Sweller 2004](https://doi.org/10.1037/0022-0663.96.3.558). Expertise reversal [◇] — [Kalyuga et al. 2003](https://doi.org/10.1207/S15326985EP3801_4)
- Immediate performance ≠ learning, so delayed checks are needed [◇] — [Soderstrom & Bjork 2015](https://doi.org/10.1177/1745691615569000)

### Inferences
**Proposed rule set.** Each rule is tied to the evidence above. Thresholds are design choices within the evidence-supported range, not empirically optimised values.

1. **Skill-level mastery (level up within a unit).** All of the following must hold:
   - Unaided first-attempt accuracy ≥ **80%** on the most recent **10** items of that skill (EMA ≥ 0.85 is an acceptable alternative).
   - The last **3** unaided attempts are correct (3-CCR), reached within ≤8 attempts in the session. Use **4–5 CCR** for foundational prerequisite skills.
   - Low-confidence correct answers do not count toward the run.
   - Basis: binomial table in Q2; Kelly et al.; Pelánek.
2. **Unit-level mastery (advance to next unit).**
   - A mixed 10–20-item unit check of new, 수능-format items at ≥ **80%**, with no skill below 60%.
   - Then a **delayed re-check** (≥ 1–7 days later, 5 items) at ≥ 80% to confirm.
   - Failing a unit check → targeted correctives on weak skills → a parallel-form re-test (Bloom/Guskey LFM).
   - After 2 failed re-tests, advance provisionally and schedule spaced review of that unit, to protect coverage (Slavin's time trade-off).
3. **Level down / add scaffolding.** Any of:
   - Accuracy < **50–60%** over the last 5–10 items of a skill.
   - 2 consecutive errors on the same skill *after* elaborated feedback.
   - Mental effort ≥ 7/9 with < 60% accuracy.
   - A conceptual error (see 5).
   - Action: move back one step in example → faded → problem, or drop item level L(n) → L(n−1) (Q6 rubric). Adaptive fading per Salden et al.; efficiency logic per Paas and Kalyuga & Sweller 2005.
4. **Skip ahead.** On ≥2 of 3 rapid first-step diagnostic items correct (or final answer given directly), skip worked examples for that skill. If also ≥4/5 on a quick check, mark it provisionally mastered, pending a delayed re-check. Basis: Kalyuga & Sweller 2004; expertise reversal.
5. **Error handling.**
   - **Slip / careless:** self-corrected on a re-check prompt without new information, and not repeated in the next 2–3 same-skill items. Log it as 실수, apply a partial penalty (EMA update rather than resetting the run to 0, i.e., treat it like BKT slip), and prompt a verification habit. If "careless" errors on one skill reach ≥2 in 10 items, reclassify as procedural.
   - **Procedural:** the same wrong step on ≥2 items. Show a side-by-side worked example (wrong step vs correct step) plus 2–3 isolated drills.
   - **Conceptual:** wrong across surface variants, or cannot explain. Go back to the prerequisite skill and the full worked example sequence.
   - **High-confidence errors:** always elaborated feedback, plus a delayed re-test (hypercorrection).
   - **Every error:** correct answer + explanation + distractor analysis (no correctness-only feedback). Add it to a spaced re-test queue (오답 re-attempts on different days, cleared after 2 correct re-tries).
6. **Feedback timing.**
   - Step-level or immediate in acquisition mode (novice, new skill).
   - End-of-set feedback in 수능-style practice and mock tests, with a review the same or next day (Shute; Butler et al. 2007; Van der Kleij 2015).
7. **Practice difficulty while not yet mastered.** Keep success during practice at roughly 70–85% by choosing item level. Below that, apply the level-down rule; above ~90% on consecutive sets, raise the level. This is consistent with the 85% rule (theoretical) and with element-interactivity guidance. Desirable-difficulty and spacing evidence is covered by other researchers' notes.

### Gaps
- No primary study has tested this exact combined rule set, or any mastery rule, for adult 수능 learners. It should be treated as a hypothesis to tune with the learner's own data (e.g., check whether "mastered" skills hold at ≥80% on 1-week delayed checks; if not, raise N or the threshold).
- How many items per skill are needed for a *reliable* mastery decision depends on item difficulty variance and guessing (5-option MC = 0.2). The 8–10 item figure comes from my binomial calculation, not from a published psychometric study for this population.
- I found no direct evidence on whether careless-error rates in adults can be lowered by error logging specifically, versus general self-checking instruction.
