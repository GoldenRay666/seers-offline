.class final Lcom/taomee/seer2/u/ad;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {}, Lcom/taomee/seer2/u/j;->a()Lcom/taomee/seer2/u/j;

    move-result-object v0

    invoke-static {}, Lcom/taomee/seer2/u/ac;->b()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/taomee/seer2/u/j;->a(Landroid/content/Context;Z)V

    return-void
.end method
