.class Lcom/taomee/seer2/u/b/o;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Lcom/taomee/seer2/u/b/k;

.field final synthetic b:Lcom/taomee/seer2/u/b/n;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/u/b/n;[Lcom/taomee/seer2/u/b/k;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/b/o;->b:Lcom/taomee/seer2/u/b/n;

    iput-object p2, p0, Lcom/taomee/seer2/u/b/o;->a:[Lcom/taomee/seer2/u/b/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/u/b/o;->b:Lcom/taomee/seer2/u/b/n;

    iget-object v0, v0, Lcom/taomee/seer2/u/b/n;->b:Lcom/taomee/seer2/u/b/m;

    invoke-static {v0}, Lcom/taomee/seer2/u/b/m;->b(Lcom/taomee/seer2/u/b/m;)Lcom/taomee/seer2/u/b/p;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/u/b/o;->a:[Lcom/taomee/seer2/u/b/k;

    invoke-interface {v0, v1}, Lcom/taomee/seer2/u/b/p;->a([Lcom/taomee/seer2/u/b/k;)V

    return-void
.end method
