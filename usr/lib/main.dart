import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Research Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A), // Deep blue corporate theme
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
          bodyLarge: TextStyle(fontSize: 22, height: 1.5),
          bodyMedium: TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationScreen(),
      },
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<SlideData> _slides;

  @override
  void initState() {
    super.initState();
    _slides = [
      // 1. Title Slide
      SlideData(
        title: '',
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Project Title: AI in Modern Healthcare',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildInfoRow(Icons.person, 'Student Name(s): Jane Doe, John Smith'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.book, 'Course: Advanced Computer Science 401'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.school, 'Guide Name: Dr. Alan Turing'),
            ],
          ),
        ),
      ),

      // 2. Introduction
      SlideData(
        title: 'Introduction',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBulletPoint('Background: The rapid integration of Artificial Intelligence in medical diagnostics has transformed patient care over the last decade.'),
            const SizedBox(height: 24),
            _buildBulletPoint('Importance of the Study: Understanding the efficacy and limitations of these AI models is crucial for ensuring patient safety, reducing diagnostic errors, and optimizing hospital workflows.'),
            const SizedBox(height: 24),
            _buildBulletPoint('Context: This study focuses specifically on predictive models used in early-stage oncology.'),
          ],
        ),
      ),

      // 3. Review of Literature
      SlideData(
        title: 'Review of Literature',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLiteratureItem(
              '1. Smith et al. (2022)',
              'Demonstrated a 15% increase in diagnostic accuracy using Convolutional Neural Networks (CNNs) for MRI scans.',
            ),
            const SizedBox(height: 24),
            _buildLiteratureItem(
              '2. Johnson & Lee (2023)',
              'Highlighted the challenges of algorithmic bias in diverse patient populations, emphasizing the need for representative training data.',
            ),
            const SizedBox(height: 24),
            _buildLiteratureItem(
              '3. Patel Research Group (2023)',
              'Found that AI-assisted doctors performed 20% faster in routine screenings compared to doctors working without AI assistance.',
            ),
          ],
        ),
      ),

      // 4. Statement of the Problem
      SlideData(
        title: 'Statement of the Problem',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border(left: BorderSide(color: Colors.red.shade400, width: 6)),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              ),
              child: const Text(
                'Despite the high accuracy of AI models in controlled environments, their real-world clinical application often suffers from a "performance drop" due to varied data quality and lack of seamless integration into existing hospital IT infrastructure.',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 32),
            _buildBulletPoint('High false-positive rates in non-standardized imaging.'),
            const SizedBox(height: 16),
            _buildBulletPoint('Resistance to adoption among senior medical staff.'),
          ],
        ),
      ),

      // 5. Objectives of the Study
      SlideData(
        title: 'Objectives of the Study',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This research aims to achieve the following primary objectives:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            _buildNumberedPoint('1', 'To evaluate the real-world accuracy of AI diagnostic tools across three different hospital networks.'),
            const SizedBox(height: 16),
            _buildNumberedPoint('2', 'To identify the primary technical and cultural barriers to AI adoption in clinical settings.'),
            const SizedBox(height: 16),
            _buildNumberedPoint('3', 'To propose a standardized framework for integrating predictive AI models into existing Electronic Health Record (EHR) systems.'),
          ],
        ),
      ),

      // 6. Methodology
      SlideData(
        title: 'Methodology',
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildMethodologyCard(
                Icons.storage,
                'Data',
                'Anonymized patient records and MRI scans from 2020-2023. Total dataset size: 50,000 records.',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildMethodologyCard(
                Icons.people,
                'Sample',
                'Stratified random sampling of 5,000 patients across 3 demographics. Survey of 150 medical professionals.',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildMethodologyCard(
                Icons.build,
                'Tools',
                'Python (TensorFlow/PyTorch) for model validation. SPSS for statistical analysis of survey data.',
              ),
            ),
          ],
        ),
      ),

      // 7. Findings
      SlideData(
        title: 'Findings - Key Results',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBulletPoint('AI assistance improved early detection rates by 18%.'),
            _buildBulletPoint('Integration time was the biggest hurdle (average 6 months).'),
            const SizedBox(height: 32),
            const Text(
              'Diagnostic Accuracy Comparison (%)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBarChart(65, 'Human Only', Colors.blueGrey),
                  _buildBarChart(82, 'AI Only', Colors.lightBlue),
                  _buildBarChart(94, 'Human + AI', const Color(0xFF1E3A8A)),
                ],
              ),
            ),
          ],
        ),
      ),

      // 8. Conclusion
      SlideData(
        title: 'Conclusion',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBulletPoint('Summary: The study confirms that AI is not a replacement for medical professionals, but a powerful augmentative tool. The "Human + AI" approach yields the highest diagnostic accuracy.'),
            const SizedBox(height: 24),
            _buildBulletPoint('Outcome: We successfully developed a proposed integration framework that reduces deployment time by an estimated 30%.'),
            const SizedBox(height: 24),
            _buildBulletPoint('Future Scope: Further research should focus on longitudinal studies of patient outcomes post-AI integration.'),
            const Spacer(),
            const Center(
              child: Text(
                'Thank You!',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ];
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.blueGrey),
        const SizedBox(width: 16),
        Text(text, style: const TextStyle(fontSize: 24)),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, right: 16.0),
          child: Icon(Icons.circle, size: 12, color: Color(0xFF1E3A8A)),
        ),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 22, height: 1.5)),
        ),
      ],
    );
  }

  Widget _buildNumberedPoint(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: Color(0xFF1E3A8A),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 22, height: 1.5)),
        ),
      ],
    );
  }

  Widget _buildLiteratureItem(String author, String finding) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(author, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
          const SizedBox(height: 8),
          Text(finding, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildMethodologyCard(IconData icon, String title, String description) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF1E3A8A)),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 18, height: 1.4)),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(double percentage, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${percentage.toInt()}%', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: percentage * 3, // Scale factor for visual representation
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
        ),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9, // Standard presentation aspect ratio
          child: Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // Slide Content
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      final slide = _slides[index];
                      return Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (slide.title.isNotEmpty) ...[
                              Text(
                                slide.title,
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 16),
                              Container(height: 4, width: 100, color: const Color(0xFF1E3A8A)),
                              const SizedBox(height: 40),
                            ],
                            Expanded(child: slide.content),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // Presentation Controls
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border(top: BorderSide(color: Colors.grey.shade200)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _currentPage > 0 ? _previousPage : null,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                      Text(
                        'Slide ${_currentPage + 1} of ${_slides.length}',
                        style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                      ),
                      TextButton.icon(
                        onPressed: _currentPage < _slides.length - 1 ? _nextPage : null,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next'),
                        iconAlignment: IconAlignment.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideData {
  final String title;
  final Widget content;

  SlideData({required this.title, required this.content});
}
