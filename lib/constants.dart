import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 60, 55, 178);
const kAccentColor = Color.fromARGB(255, 250, 227, 194);
const kTextColor = Colors.black;
const kBGColor = Colors.white;
const kCardsBGColor = Color.fromARGB(255, 241, 244, 251);

List<Category> categories = [
  Category(id: "1", name: "IT", icon: Icon(Icons.computer), jobs: [
    Job(
        id: "1",
        title: "UI/UX Designer",
        totalJob: 4,
        salary: "\$8k - \$6k",
        description: '''Candidate should be Graduate.
        Should have 6 months Experience of Adobe Coreldraw, Photoshop, In Design.
        Should have an impact graphic designing portfolio.
        Fresher can also apply.
        Job Timing : 11:00am - 7:00pm.
        Salary: Up to Rs. 20000/-PM.'''),
    Job(
        id: "2",
        title: "iOS Developer",
        totalJob: 13,
        salary: "\$16k - \$14k",
        description:
            "Working for the SetBlue.com team, you will lead internal design requirements for CRES. Working closely with the Communication team you will deliver tailor-made designs related to various areas of excellence under SetBlue on a global level. You will be responsible for understanding the brief, research, conceptualization, storyboarding, design of collateral and maintaining the repository."),
    Job(
        id: "3",
        title: "Android Developer",
        totalJob: 2,
        salary: "\$12k - \$10k",
        description: ''''- Study design briefs and determine requirements
            - Conceptualize visuals based on requirements
    - Prepare rough drafts and present ideas
        - Develop illustrations, logos and other designs using software or by hand
    - Use the appropriate colors and layouts for each graphic
    - Work with creative team to produce final design
    - Test graphics across various media
    - Ensure final graphics and layouts are visually appealing and on-brand

    Skills Required:
    - Proven graphic designing experience
    - Familiarity with design software and technologies (such as InDesign, Illustrator, Dreamweaver, Photoshop)
        - A keen eye for aesthetics and details
    - Excellent communication skills
    - Ability to work methodically and meet deadlines'''),
    Job(
        id: "4",
        title: "Graphics Designer",
        totalJob: 4,
        salary: "\$8k - \$6k",
        description:
            '''Develop and execute compelling creative designs to engage customers and prospects.
        Produce new website designs, and banners with a strong understanding of the elements of design such as typography, composition, color, and imagery.
    Maintain and develop consistent site-wide graphic design.
        Conceptualize new templates and site designs.
        Design, test and produce digital material including emails, graphics, multimedia, etc.
    Design and optimize email and page templates for recurring use.
    Proactively offer suggestions and strategies to drive engagement and revenue through web design and presentation.
    Pro-active self-starter and independent thinker with ability to be creative, flexible, and detail-oriented under daily deadlines with multiple projects.'''),
    Job(
        id: "5",
        title: "Lead UI Designer",
        totalJob: 4,
        salary: "\$8k - \$6k",
        description:
            "JOB DETAILS1) Designing Women wear2) Working with others in the design team, such as buyers and forecasters, to developproducts to meet a brief3) Adapting existing designs for mass productionFUNCTIONAL AREAFashion designer, Sr. Fashion designer, fashion designing, Apparel designing, garment designing, ethenic wear designer, jobs for fashion designer in surat, jobs for senior fashion designer in gujrat, traditional wear designer"),
  ]),
  Category(id: "2", name: "Science", icon: Icon(Icons.computer), jobs: []),
  Category(id: "3", name: "Culture", icon: Icon(Icons.computer), jobs: []),
  Category(id: "4", name: "Beauty", icon: Icon(Icons.computer), jobs: []),
  Category(id: "5", name: "Business", icon: Icon(Icons.computer), jobs: []),
];

class Category {
  final String id, name;
  final Icon icon;
  final List<Job> jobs;
  Category({this.id, this.name, this.icon, this.jobs});
}

class Job {
  final String id, title, salary, description;
  final int totalJob;

  Job({this.id, this.title, this.totalJob, this.salary, this.description});
}
