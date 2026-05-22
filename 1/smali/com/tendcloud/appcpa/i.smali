.class Lcom/tendcloud/appcpa/i;
.super Lcom/tendcloud/appcpa/a;


# instance fields
.field final synthetic b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/i;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1}, Lcom/tendcloud/appcpa/a;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    iget-object v0, p0, Lcom/tendcloud/appcpa/i;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/appcpa/k;->b(J)V

    iget-object v0, p0, Lcom/tendcloud/appcpa/i;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->d(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x4b0

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
