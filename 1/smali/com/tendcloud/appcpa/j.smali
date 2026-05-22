.class Lcom/tendcloud/appcpa/j;
.super Lcom/tendcloud/appcpa/a;


# instance fields
.field final synthetic b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1}, Lcom/tendcloud/appcpa/a;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    iget-object v0, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->h()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->c(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/appcpa/h;->b(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/tendcloud/appcpa/k;->f(Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->i()V

    iget-object v0, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->d(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/tendcloud/appcpa/c;

    iget-object v2, p0, Lcom/tendcloud/appcpa/j;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v1, v2}, Lcom/tendcloud/appcpa/c;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
