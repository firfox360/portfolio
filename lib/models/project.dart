class Project {
  final String title;
  final String description;
  final List<String> features;
  final List<String> techStack;
  final String imageUrl;

  Project({
    required this.title,
    required this.description,
    required this.features,
    required this.techStack,
    required this.imageUrl,
  });
}

final List<Project> myProjects = [
  Project(
    title: 'Inspection Management App',
    description: 'A mobile application used for performing inspections, managing questions, uploading images, and syncing data with backend APIs.',
    features: ['Offline data storage', 'Inspection forms', 'Image upload', 'API synchronization', 'NOC handling'],
    techStack: ['Flutter', 'Bloc', 'REST API', 'SQLite'],
    imageUrl: 'assets/images/project1.png',
  ),
  Project(
    title: 'Consumption RFID Management App',
    description: 'Mobile app for tracking and managing RFID items with location and equipment selection.',
    features: ['RFID item listing', 'Location/equipment selection', 'Data synchronization', 'Clean state management'],
    techStack: ['Flutter', 'Bloc', 'API Integration'],
    imageUrl: 'assets/images/project2.png',
  ),
  Project(
    title: 'Travel Vlog Companion App',
    description: 'An app designed to manage travel content and video metadata for vlog creators.',
    features: ['Media management', 'Travel locations', 'Upload tracking'],
    techStack: ['Flutter', 'Firebase'],
    imageUrl: 'assets/images/project3.png',
  ),
];
