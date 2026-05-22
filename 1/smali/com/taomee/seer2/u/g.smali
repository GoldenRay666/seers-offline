.class Lcom/taomee/seer2/u/g;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/u/f;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/u/f;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/g;->a:Lcom/taomee/seer2/u/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/u/g;->a:Lcom/taomee/seer2/u/f;

    iget-object v0, v0, Lcom/taomee/seer2/u/f;->b:Lcom/taomee/seer2/u/e;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/taomee/seer2/u/e;->a(Lcom/taomee/seer2/u/e;Z)Z

    return-void
.end method
