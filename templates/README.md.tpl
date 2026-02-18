<div align="center">
    <img src="./assets/terminal.gif" alt="Terminal GIF"/>
</div>

### Main skills
[![My Skills](https://skillicons.dev/icons?i=php,symfony,docker,postgres,mysql,git,github,gitlab,js,html,css,linux,bash,phpstorm)](https://skillicons.dev)

### Recent contributions
{{range recentContributions 20}}
{{- if ne .Repo.Name "camilleislasse/memes"}}
- [{{.Repo.Name}}]({{.Repo.URL}}){{if .Repo.Description}} {{.Repo.Description}}{{end}} `{{humanize .OccurredAt}}`
{{- end}}
{{- end}}

### Recent pull requests
{{range recentPullRequests 50}}
{{- if ne .Repo.Name "camilleislasse/memes"}}
- [{{.Title}}]({{.URL}}) on **{{.Repo.Name}}** ({{if eq .State "MERGED"}}merged{{else if eq .State "OPEN"}}open{{else}}closed{{end}})
{{- end}}
{{- end}}

### Connect with me!
<a href="https://www.linkedin.com/in/camilleislasse/">
    <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/>
</a>
<a href="https://github.com/camilleislasse/camilleislasse/raw/main/assets/cv-camille-islasse.pdf">
    <img src="https://img.shields.io/badge/Curriculum%20Vitae-0072ff?style=for-the-badge&logoColor=white" alt="CV"/>
</a>