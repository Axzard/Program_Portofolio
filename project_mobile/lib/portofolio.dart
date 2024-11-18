import 'package:flutter/material.dart';


void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedHeader(isExpanded: isExpanded, toggleExpansion: toggleExpansion),
            AnimatedSkillsSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

class AnimatedHeader extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback toggleExpansion;

  AnimatedHeader({required this.isExpanded, required this.toggleExpansion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleExpansion,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: isExpanded ? 50 : 30, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(isExpanded ? 0 : 30)),
        ),
        child: Column(
          children: [
            Hero(
              tag: 'profile-pic',
              child: CircleAvatar(
                radius: isExpanded ? 80 : 60,
                backgroundImage: AssetImage('assets/images/Profil.jpg'), // Ganti dengan gambar profilmu
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Musyaitir',
              style: TextStyle(
                fontSize: isExpanded ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Informatics Student',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Skills'),
          SizedBox(height: 10),
          AnimatedSkills(),
        ],
      ),
    );
  }
}

class AnimatedSkills extends StatefulWidget {
  @override
  _AnimatedSkillsState createState() => _AnimatedSkillsState();
}

class _AnimatedSkillsState extends State<AnimatedSkills> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          SkillChip(skill: 'Pubg Mobile'),
          SkillChip(skill: 'Clash Of Clans'),
          SkillChip(skill: 'UI/UX Design'),
          SkillChip(skill: 'Web Developer'),
          SkillChip(skill: 'Clash Of Royale'),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.blueAccent.withOpacity(0.2),
      labelStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {'title': 'App Portofolio', 'description': 'Aplikasi ini dibuat dengan Flutter'},
    {'title': 'Aplikasi SIM', 'description': 'Sistem antrean pembuatan SIM'},
    {'title': 'E-Commerce UI', 'description': 'Desain aplikasi belanja dengan Flutter'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Projects'),
          SizedBox(height: 10),
          ListView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProjectCard(
                title: projects[index]['title']!,
                description: projects[index]['description']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.folder, color: Colors.blueAccent),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward, color: Colors.blueAccent),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Contact Me'),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.email, color: Colors.blueAccent),
            title: Text('musyaitir@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.blueAccent),
            title: Text('081280373314'),
          ),
          ListTile(
            leading: Icon(Icons.link, color: Colors.blueAccent),
            title: Text('Axzard@github.com'),
            onTap: () {
              // Tambahkan logika jika ingin membuka link
            },
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
    );
  }
}
