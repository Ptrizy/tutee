class ProgramBelajar {
  final String id;
  final String nama;
  final String deskripsi;
  final String icon;
  final List<String> bab;
  final bool isActive;

  ProgramBelajar({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.icon,
    required this.bab,
    this.isActive = false,
  });
}

class ModulData {
  final String id;
  final String judul;
  final String konten;
  final bool isCompleted;

  ModulData({
    required this.id,
    required this.judul,
    required this.konten,
    this.isCompleted = false,
  });
}

class DummyData {
  static List<ProgramBelajar> programBelajarList = [
    ProgramBelajar(
      id: '1',
      nama: 'Pemrograman Web',
      deskripsi:
          'Pemrograman web adalah proses pembuatan dan pengembangan situs web atau aplikasi web.',
      icon: 'assets/pemweb.svg',
      isActive: true,
      bab: [
        'Definisi HTML',
        'Dasar HTML',
        'Styling',
        'JavaScript',
        'HTML dan JavaScript',
        'Latihan',
      ],
    ),
    ProgramBelajar(
      id: '2',
      nama: 'Pemrograman Android',
      deskripsi:
          'Belajar membuat aplikasi mobile Android menggunakan Kotlin dan Java.',
      icon: 'assets/android.svg',
      bab: [
        'Pengenalan Android',
        'Activity dan Fragment',
        'Layout Design',
        'Database SQLite',
        'API Integration',
        'Publishing App',
      ],
    ),
    ProgramBelajar(
      id: '3',
      nama: 'Data Science',
      deskripsi:
          'Analisis data dan machine learning untuk menghasilkan insights bisnis.',
      icon: 'assets/data-science.svg',
      bab: [
        'Pengenalan Data Science',
        'Python untuk Data Science',
        'Data Visualization',
        'Machine Learning Basics',
        'Deep Learning',
        'Real World Projects',
      ],
    ),
    ProgramBelajar(
      id: '4',
      nama: 'Data Mining',
      deskripsi: 'Teknik ekstraksi pola dan informasi dari dataset besar.',
      icon: 'assets/data-mining.svg',
      bab: [
        'Konsep Data Mining',
        'Data Preprocessing',
        'Classification Algorithms',
        'Clustering Techniques',
        'Association Rules',
        'Evaluation Methods',
      ],
    ),
    ProgramBelajar(
      id: '5',
      nama: 'Project Management',
      deskripsi:
          'Pelajari metodologi dan tools untuk mengelola proyek dengan efektif.',
      icon: 'assets/project-management.svg',
      bab: [
        'Dasar Project Management',
        'Agile Methodology',
        'Scrum Framework',
        'Risk Management',
        'Team Leadership',
        'Project Evaluation',
      ],
    ),
    ProgramBelajar(
      id: '6',
      nama: 'Pemrograman Dasar Java',
      deskripsi: 'Fundamental programming dengan bahasa Java untuk pemula.',
      icon: 'assets/pemdas-java.svg',
      bab: [
        'Syntax Java',
        'Object Oriented Programming',
        'Collections Framework',
        'Exception Handling',
        'File I/O',
        'Multithreading',
      ],
    ),
  ];

  static List<ModulData> getModulesForProgram(String programId) {
    switch (programId) {
      case '1':
        return [
          ModulData(
            id: '1',
            judul: 'Definisi HTML',
            konten: '''
HTML (HyperText Markup Language) adalah bahasa markup standar yang digunakan untuk membuat halaman web. HTML bukanlah bahasa pemrograman, melainkan bahasa markup yang menggunakan tag-tag khusus untuk menandai berbagai elemen dalam dokumen web. Setiap tag HTML memiliki fungsi spesifik untuk menentukan struktur dan makna konten.

HTML pertama kali dikembangkan oleh Tim Berners-Lee pada tahun 1991 dan terus berkembang hingga versi HTML5 yang kita gunakan saat ini. HTML5 memperkenalkan elemen-elemen semantik baru yang membantu mesin pencari dan teknologi assistive memahami struktur konten dengan lebih baik.

Struktur dasar dokumen HTML terdiri dari elemen html, head, dan body. Elemen head berisi metadata seperti title, description, dan link ke file CSS atau JavaScript. Sedangkan elemen body berisi konten yang akan ditampilkan kepada pengguna seperti teks, gambar, video, dan elemen interaktif lainnya.

HTML bekerja dengan prinsip nested elements, di mana elemen dapat berada di dalam elemen lain. Setiap elemen dapat memiliki atribut yang memberikan informasi tambahan atau mengubah perilaku elemen tersebut. Pemahaman yang baik tentang HTML adalah fondasi penting untuk menjadi web developer yang kompeten.
''',
          ),
          ModulData(
            id: '2',
            judul: 'Dasar HTML',
            konten: '''
Elemen dasar HTML mencakup berbagai tag yang digunakan untuk membuat struktur konten web. Tag heading (h1-h6) digunakan untuk judul dan sub-judul dengan hierarki yang jelas. Tag paragraf (p) untuk teks biasa, sedangkan tag div dan span untuk grouping dan styling elemen.

List adalah elemen penting dalam HTML yang terdiri dari ordered list (ol) dan unordered list (ul) dengan item list (li). Untuk membuat link, kita menggunakan tag anchor (a) dengan atribut href. Tag img digunakan untuk menampilkan gambar dengan atribut src dan alt yang penting untuk accessibility.

Form adalah elemen interaktif yang memungkinkan pengguna mengirim data. Elemen form terdiri dari input fields seperti text, email, password, checkbox, radio button, dan textarea. Setiap input sebaiknya memiliki label yang jelas untuk meningkatkan usability.

Table digunakan untuk menampilkan data tabular dengan struktur thead, tbody, tr (table row), th (table header), dan td (table data). HTML5 juga memperkenalkan elemen semantik seperti header, nav, main, article, section, aside, dan footer yang membantu menjelaskan struktur konten dengan lebih bermakna.
''',
          ),
          ModulData(
            id: '3',
            judul: 'Styling',
            konten: '''
CSS (Cascading Style Sheets) adalah bahasa stylesheet yang mengontrol tampilan visual elemen HTML. CSS memisahkan presentasi dari struktur, memungkinkan kita mengubah tampilan tanpa memodifikasi HTML. Ada tiga metode implementasi CSS: inline, internal, dan external stylesheet.

Selector CSS digunakan untuk menargetkan elemen HTML yang akan diberi styling. Jenis selector meliputi element selector, class selector (.), id selector (#), dan attribute selector. Cascading mengacu pada urutan prioritas ketika beberapa rule CSS berlaku pada elemen yang sama.

Box model adalah konsep fundamental CSS yang terdiri dari content, padding, border, dan margin. Memahami box model penting untuk mengontrol layout dan spacing elemen. CSS3 memperkenalkan fitur-fitur baru seperti border-radius, box-shadow, gradients, dan transforms yang memungkinkan efek visual yang lebih menarik.

Layout CSS modern menggunakan Flexbox dan Grid. Flexbox ideal untuk layout satu dimensi (horizontal atau vertikal), sedangkan Grid cocok untuk layout dua dimensi. Media queries memungkinkan responsive design yang menyesuaikan tampilan dengan berbagai ukuran layar. Preprocessing seperti Sass atau Less dapat meningkatkan efisiensi penulisan CSS dengan fitur variables, nesting, dan mixins.
''',
          ),
          ModulData(
            id: '4',
            judul: 'JavaScript',
            konten: '''
JavaScript adalah bahasa pemrograman dinamis yang menambahkan interaktivitas pada halaman web. Berbeda dengan HTML dan CSS yang bersifat statis, JavaScript memungkinkan manipulasi DOM, handling events, dan komunikasi dengan server. JavaScript dapat dijalankan di browser (client-side) dan server (Node.js).

Konsep dasar JavaScript mencakup variables (var, let, const), data types (string, number, boolean, object, array), operators, dan control structures (if/else, loops). Functions adalah building block penting yang memungkinkan code reusability. ES6+ memperkenalkan fitur modern seperti arrow functions, destructuring, dan template literals.

DOM (Document Object Model) manipulation memungkinkan JavaScript mengubah struktur, style, dan konten HTML secara dinamis. Event handling memungkinkan respons terhadap user actions seperti click, hover, atau form submission. AJAX dan Fetch API memungkinkan komunikasi asynchronous dengan server tanpa reload halaman.

JavaScript modern menggunakan concepts seperti closures, callbacks, promises, dan async/await untuk handling asynchronous operations. Framework dan library seperti React, Vue, atau Angular mempermudah pengembangan aplikasi web kompleks. Understanding JavaScript fundamentals adalah kunci untuk menjadi full-stack developer yang efektif.
''',
          ),
          ModulData(
            id: '5',
            judul: 'HTML dan JavaScript',
            konten: '''
Integrasi HTML dan JavaScript menciptakan web pages yang dinamis dan interaktif. JavaScript dapat dimasukkan ke HTML menggunakan tag script, baik inline maupun external file. Best practice adalah menempatkan script di akhir body atau menggunakan defer/async attributes untuk optimasi loading.

DOM manipulation adalah core skill yang memungkinkan JavaScript mengakses dan memodifikasi elemen HTML. Methods seperti getElementById, querySelector, createElement, dan appendChild adalah fundamental untuk dynamic content creation. Event listeners memungkinkan respons terhadap user interactions secara real-time.

Form validation adalah aplikasi praktis HTML-JavaScript integration. JavaScript dapat memvalidasi input fields, menampilkan error messages, dan mencegah form submission jika data tidak valid. Hal ini meningkatkan user experience dan mengurangi server load.

Local Storage dan Session Storage memungkinkan penyimpanan data di browser tanpa cookies. Ini berguna untuk menyimpan user preferences atau temporary data. JSON (JavaScript Object Notation) adalah format standar untuk pertukaran data antara client dan server.

Progressive Web Apps (PWA) menggunakan teknologi web modern untuk memberikan pengalaman seperti native app. Service workers, web app manifest, dan caching strategies adalah teknologi kunci PWA. Understanding HTML-JavaScript integration membuka jalan untuk web development yang lebih advanced.
''',
          ),
          ModulData(
            id: '6',
            judul: 'Latihan',
            konten: '''
Project-based learning adalah cara terbaik untuk menguasai web development. Mulai dengan membuat personal portfolio website yang menampilkan skills dan projects Anda. Portfolio harus responsive, accessible, dan mendemonstrasikan kemampuan HTML, CSS, dan JavaScript yang telah dipelajari.

To-do list application adalah project klasik yang mengajarkan CRUD operations (Create, Read, Update, Delete). Implementasikan fitur tambah task, mark as completed, edit task, dan delete task. Gunakan Local Storage untuk persistence data. Tambahkan fitur filtering dan sorting untuk meningkatkan functionality.

Weather app menggunakan public API untuk menampilkan informasi cuaca real-time. Project ini mengajarkan API integration, asynchronous programming, dan error handling. Implementasikan fitur search by city, display current weather, dan forecast. Perhatikan responsive design untuk berbagai device sizes.

E-commerce product catalog menggabungkan semua konsep yang telah dipelajari. Buat halaman yang menampilkan daftar produk, product detail, shopping cart functionality, dan checkout form. Gunakan JavaScript untuk dynamic content loading, cart management, dan form validation.

Blog website dengan comment system mengajarkan content management dan user interaction. Implementasikan fitur post creation, comment submission, dan content filtering. Focus pada semantic HTML, accessibility, dan SEO optimization. Deploy project menggunakan platform seperti Netlify atau Vercel untuk production experience.
''',
          ),
        ];
      case '4':
        return [
          ModulData(
            id: '1',
            judul: 'Pengenalan Data Science',
            konten: '''
Data Science adalah bidang interdisipliner yang menggabungkan statistik, matematika, pemrograman, dan domain expertise untuk mengekstrak insights dari data. Data Science melibatkan entire data lifecycle mulai dari data collection, cleaning, analysis, hingga visualization dan interpretation. Tujuan utamanya adalah mengubah raw data menjadi actionable insights untuk decision making.

Data Science berbeda dengan traditional statistics karena fokus pada big data, machine learning, dan predictive analytics. Modern data science menggunakan advanced computational tools dan algorithms untuk menangani volume, velocity, dan variety data yang besar. Skills yang dibutuhkan meliputi programming (Python/R), statistics, machine learning, dan data visualization.

Data Science process mengikuti metodologi seperti CRISP-DM (Cross-Industry Standard Process for Data Mining) yang terdiri dari business understanding, data understanding, data preparation, modeling, evaluation, dan deployment. Setiap tahap memiliki deliverables dan success criteria yang jelas.

Career paths dalam Data Science beragam, mulai dari Data Analyst, Data Scientist, Machine Learning Engineer, hingga Data Engineer. Setiap role memiliki focus dan responsibilities yang berbeda. Industry applications mencakup finance, healthcare, retail, technology, dan government. Data Science applications yang populer termasuk recommendation systems, fraud detection, predictive maintenance, dan customer segmentation.
''',
          ),
          ModulData(
            id: '2',
            judul: 'Python untuk Data Science',
            konten: '''
Python adalah bahasa pemrograman paling populer untuk Data Science karena sintaks yang mudah dipahami, ecosystem yang kaya, dan community support yang kuat. Python menyediakan powerful libraries yang specifically designed untuk data manipulation, analysis, dan visualization.

NumPy adalah foundation library yang menyediakan support untuk large multi-dimensional arrays dan mathematical functions. NumPy arrays lebih efisien dalam memory dan computation dibanding Python lists. Operasi vectorized NumPy memungkinkan fast mathematical operations tanpa explicit loops.

Pandas adalah library essential untuk data manipulation dan analysis. DataFrame adalah primary data structure yang mirip spreadsheet atau SQL table. Pandas menyediakan tools untuk reading data dari berbagai sources (CSV, Excel, SQL, JSON), data cleaning, filtering, grouping, dan aggregation operations.

Jupyter Notebook adalah interactive development environment yang ideal untuk data science workflows. Notebook memungkinkan kombinasi code, visualization, dan documentation dalam single document. Best practices untuk Python data science include code organization, proper documentation, version control, dan reproducible analysis.

Virtual environments dan package management menggunakan conda atau pip penting untuk project isolation dan dependency management. Understanding Python fundamentals seperti data structures, control flow, functions, dan object-oriented programming akan mempermudah learning curve dalam data science applications.
''',
          ),
          ModulData(
            id: '3',
            judul: 'Data Visualization',
            konten: '''
Data visualization adalah art dan science untuk menyajikan data dalam format visual yang mudah dipahami dan actionable. Effective visualization membantu identify patterns, trends, outliers, dan relationships yang tidak terlihat dalam raw data. Visualization adalah communication tool yang powerful untuk stakeholders dengan berbagai technical backgrounds.

Matplotlib adalah fundamental plotting library yang menyediakan fine-grained control untuk creating static, animated, dan interactive visualizations. Matplotlib menggunakan object-oriented API yang memungkinkan customization detail setiap aspect dari plot. Understanding matplotlib architecture penting untuk advanced visualization techniques.

Seaborn dibangun di atas matplotlib dan menyediakan high-level interface untuk statistical visualizations. Seaborn memiliki built-in themes dan color palettes yang aesthetically pleasing. Specialty plots seperti heatmaps, pair plots, violin plots, dan distribution plots sangat berguna untuk exploratory data analysis.

Plotly memungkinkan interactive visualizations yang dapat di-zoom, hover, dan filter. Interactive dashboards menggunakan Plotly Dash memungkinkan real-time data exploration. Web-based visualizations dapat di-share dan di-embed dalam applications atau presentations.

Best practices dalam data visualization meliputi choosing appropriate chart types, using colors effectively, avoiding chart junk, ensuring accessibility, dan telling compelling data stories. Understanding cognitive psychology dan visual perception principles membantu create visualizations yang effective dan tidak misleading. Always consider audience dan context ketika designing visualizations.
''',
          ),
          ModulData(
            id: '4',
            judul: 'Machine Learning Basics',
            konten: '''
Machine Learning adalah subset dari Artificial Intelligence yang memungkinkan komputer belajar dan membuat decisions tanpa explicitly programmed untuk setiap scenario. ML algorithms dapat identify patterns dalam data dan make predictions atau decisions berdasarkan pattern tersebut.

Supervised learning menggunakan labeled training data untuk learn mapping antara inputs dan outputs. Classification problems predict categorical outcomes (spam/not spam), sedangkan regression problems predict continuous values (price prediction). Popular algorithms include linear regression, logistic regression, decision trees, random forest, dan support vector machines.

Unsupervised learning bekerja dengan unlabeled data untuk discover hidden patterns. Clustering algorithms seperti K-means grouping similar data points, sedangkan dimensionality reduction techniques seperti PCA (Principal Component Analysis) mengurangi feature space sambil mempertahankan important information.

Scikit-learn adalah library Python yang comprehensive untuk machine learning dengan consistent API across different algorithms. Model evaluation menggunakan metrics seperti accuracy, precision, recall, F1-score untuk classification, dan MAE, MSE, R-squared untuk regression. Cross-validation techniques membantu assess model performance dan avoid overfitting.

Feature engineering adalah process untuk selecting, modifying, atau creating features yang relevant untuk machine learning models. Good features dapat significantly improve model performance. Data preprocessing steps include handling missing values, encoding categorical variables, feature scaling, dan outlier detection. Understanding data dan domain knowledge crucial untuk effective feature engineering.
''',
          ),
          ModulData(
            id: '5',
            judul: 'Deep Learning',
            konten: '''
Deep Learning adalah subset dari Machine Learning yang menggunakan artificial neural networks dengan multiple layers untuk learning complex patterns dari data. Deep learning terinspirasi dari human brain structure dan dapat automatically learn hierarchical representations dari raw data tanpa manual feature engineering.

Neural networks terdiri dari interconnected nodes (neurons) yang organized dalam layers: input layer, hidden layers, dan output layer. Setiap connection memiliki weight yang di-adjust selama training process menggunakan backpropagation algorithm. Activation functions seperti ReLU, sigmoid, dan tanh memperkenalkan non-linearity yang memungkinkan network learn complex patterns.

Convolutional Neural Networks (CNNs) adalah architecture yang specialized untuk image recognition dan computer vision tasks. CNNs menggunakan convolutional layers untuk detect local features seperti edges dan textures, pooling layers untuk dimensionality reduction, dan fully connected layers untuk final classification.

Recurrent Neural Networks (RNNs) dan Long Short-Term Memory (LSTM) networks dirancang untuk sequential data seperti time series, natural language, dan speech. RNNs dapat remember previous inputs melalui hidden state, memungkinkan processing data dengan temporal dependencies.

TensorFlow dan PyTorch adalah popular deep learning frameworks yang menyediakan high-level APIs untuk building dan training neural networks. GPU acceleration sangat penting untuk training deep learning models karena computational intensity. Transfer learning menggunakan pre-trained models untuk new tasks dapat significantly reduce training time dan improve performance, especially ketika training data terbatas.
''',
          ),
          ModulData(
            id: '6',
            judul: 'Real World Projects',
            konten: '''
Real-world data science projects memerlukan end-to-end implementation mulai dari problem definition hingga deployment dan monitoring. Customer churn prediction adalah project klasik yang mengajarkan binary classification, feature engineering, dan business impact measurement. Analyze customer behavior data untuk identify customers yang likely to cancel subscription.

Recommendation system menggunakan collaborative filtering atau content-based approaches untuk suggest products atau content kepada users. Implement matrix factorization techniques atau deep learning approaches untuk build sophisticated recommendation engines. Evaluate menggunakan metrics seperti precision@k, recall@k, dan NDCG.

Time series forecasting project menggunakan historical data untuk predict future values. Sales forecasting, stock price prediction, atau demand planning adalah common applications. Implement traditional methods seperti ARIMA atau modern approaches seperti LSTM networks. Handle seasonality, trends, dan external factors yang mempengaruhi forecasts.

Natural Language Processing (NLP) project seperti sentiment analysis atau text classification menggunakan techniques seperti TF-IDF, word embeddings, atau transformer models. Social media monitoring, customer feedback analysis, atau document classification adalah practical applications.

Model deployment menggunakan cloud platforms seperti AWS, GCP, atau Azure memungkinkan models diakses melalui APIs. Implement monitoring dan logging untuk track model performance dalam production. A/B testing framework untuk evaluate model improvements. Understanding MLOps practices penting untuk sustainable machine learning systems dalam production environment.
''',
          ),
        ];
      default:
        return [];
    }
  }
}
