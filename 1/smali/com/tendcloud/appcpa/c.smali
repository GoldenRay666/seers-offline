.class Lcom/tendcloud/appcpa/c;
.super Lcom/tendcloud/appcpa/a;


# instance fields
.field final synthetic b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1}, Lcom/tendcloud/appcpa/a;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->k()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/tendcloud/appcpa/n;

    iget-object v2, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v1, v2, v0}, Lcom/tendcloud/appcpa/n;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/tendcloud/appcpa/n;->run()V

    :cond_0
    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->c()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->j()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Lcom/tendcloud/appcpa/g;

    iget-object v2, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v1, v2, v0}, Lcom/tendcloud/appcpa/g;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/tendcloud/appcpa/g;->run()V

    :cond_1
    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->h()Z

    move-result v0

    if-ne v3, v0, :cond_2

    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->e()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->m()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    new-instance v1, Lcom/tendcloud/appcpa/m;

    iget-object v2, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v1, v2, v0}, Lcom/tendcloud/appcpa/m;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/tendcloud/appcpa/m;->run()V

    :cond_2
    const-string v0, "d2"

    invoke-virtual {p0, v0}, Lcom/tendcloud/appcpa/c;->a(Ljava/lang/String;)V

    const-string v0, "w2"

    invoke-virtual {p0, v0}, Lcom/tendcloud/appcpa/c;->a(Ljava/lang/String;)V

    const-string v0, "w5"

    invoke-virtual {p0, v0}, Lcom/tendcloud/appcpa/c;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->q()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-ge v1, v3, :cond_3

    :goto_0
    return-void

    :cond_3
    iget-object v1, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v2}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->c(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/tendcloud/appcpa/h;->a(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/tendcloud/appcpa/b;

    iget-object v3, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v2, v3, v1, v0}, Lcom/tendcloud/appcpa/b;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {v2}, Lcom/tendcloud/appcpa/b;->run()V

    goto :goto_0
.end method

.method a(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/tendcloud/appcpa/k;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/tendcloud/appcpa/e;

    iget-object v2, p0, Lcom/tendcloud/appcpa/c;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v1, v2, v0}, Lcom/tendcloud/appcpa/e;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Lcom/tendcloud/appcpa/e;->a(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/tendcloud/appcpa/e;->run()V

    :cond_0
    return-void
.end method
