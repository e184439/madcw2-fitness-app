import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MemberGuidePage extends StatefulWidget {
  const MemberGuidePage({super.key});

  @override
  State<MemberGuidePage> createState() => _MemberGuidePageState();
}

class _MemberGuidePageState extends State<MemberGuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'GUIDE BOOK',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: HtmlWidget(
            """<h2>Exercise principles to help reach your goals</h2>
      <p>There are many ways of training and they can all be beneficial depending on your goals.</p>
      <p>However you choose to train, there are some basic things you can do to help get the most 
      out of your workouts.</p>
      <ol>
      <li>Pay attention to what you eat if your goal is fat loss just remember the basic principle 
      is move more than you consume. This is the simple formula which a lot of people complicate when 
      it comes to weight loss. 
      If you're training for muscle gain, the types of food you eat are also very important, 
      for example, foods high in protein. And what you eat before and after your workout can also help 
      with performance and recovery.</li>
      <li>Think about your job lots of people spend most of their day sat down. So when it comes to 
      exercise, standing rather than sitting will have multiple benefits and really help free up any 
      areas that perhaps aren't getting the movement through the restrictions of your work.</li>
      <li>Warm up properly when it comes to warming your body up at the start of training, movement-based 
      (also known as dynamic) stretches are best. This means anything that involves not standing still 
      or bringing your heart rate down, for example, lunges, walk outs, simple yoga movements or 
      cardiovascular work such as walking, cross trainer or stair master.</li>
      <li>Don't forget to cool down static/slower movement stretches are much better for this part of 
      the workout, it's a great opportunity to try and unwind and release some of those stiffer areas 
      that you just struggle to loosen up.</li>
      <br />
      <h3>Key takeaway</h3><p>Starting out at the gym, like doing anything new, can be nerve wracking. 
      By following a workout routine from day 1 and getting a bit of support from the fitness experts at 
      your induction, you'll be able to hit the ground running.</p><p>Need someone to train with?
      Our Personal Trainers have designed classes to help you achieve your fitness goals and guide you 
      through the many different workout styles with HIIT, full-body, strength and conditioning to more 
      balanced classes like yoga and pilates. Start exercising now with our free Fitness and Wellbeing 
      classes.</p><p>You can find more useful information for new gym members at our advice hub, 
      or why not enjoy a free tour of your local Nuffield Health gym.</p>""",
          ),
        ),
      ),
    );
  }
}
