// ============================================================
// 纸条内容配置文件（改这里即可换成你自己的内容）
// ------------------------------------------------------------
// 每一条代表一张纸条展开后显示的内容，支持三种类型：
//
// 1. 图片（jpg / png / gif / webp / svg 均可）
//      { title: "标题", url: "底部显示的文字(可省略)", image: "my-content/照片.jpg" }
//
// 2. 视频（mp4 / webm，展开后会自动循环播放）
//      { title: "标题", url: "底部显示的文字(可省略)", video: "my-content/视频.mp4" }
//
// 3. 文件（pdf / word / 压缩包等任意类型，纸面上显示文件图标和文件名）
//      { title: "标题", file: "my-content/文档.pdf", cover: "my-content/封面.png(可省略)" }
//
// 使用方法：
//   1. 把你的图片 / 视频 / 文件放进网站根目录的 my-content 文件夹
//      （路径相对于网站根目录，所以写成 "my-content/文件名"）
//   2. 在下面的 MY_PAPERS 列表里按上面的格式添加条目
//   3. 保存并刷新网页即可生效
//
// 当前预置的是"作业 / 作品展示"主题的占位内容，形式与原版一致（标题 + 内容 + 网址行）。
// 等你上传了自己的作品后：
//   - 图片/视频/文件：把 image / video / file 换成你的文件路径
//   - 网站链接：把 url 换成你的真实链接（网盘、作品集网站等），会显示在纸面底部
// ============================================================

export const MY_PAPERS = [
  { title: "作业展示", url: "https://homework.example", image: "data/grid-paper-works.svg" },
  { title: "作品集", url: "https://portfolio.example", image: "data/paper-protocol.svg" },
  { title: "课程设计", url: "https://coursework.example", image: "data/origami-engine.svg" },
  { title: "摄影作品", url: "https://photos.example", image: "data/crumple-lab.svg" },
  { title: "视频作品", url: "https://videos.example", image: "data/fold-toss.svg" },
  { title: "实验报告", url: "https://reports.example", image: "data/wastebasket-club.svg" },
  { title: "更多作品", url: "https://coming-soon.example", image: "data/throwaway-studio.svg" },
];
