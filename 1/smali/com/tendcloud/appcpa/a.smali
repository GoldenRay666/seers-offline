.class abstract Lcom/tendcloud/appcpa/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/a;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public run()V
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Lcom/tendcloud/appcpa/a;->a()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
