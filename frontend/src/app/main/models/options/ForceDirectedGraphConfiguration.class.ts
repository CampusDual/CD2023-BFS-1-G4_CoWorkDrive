import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';
import { ChartConfiguration } from './ChartConfiguration.class';
import { ForceDirectedGraphNode } from './ForceDirectedGraphNode.class';
import { ForceDirectedGraphLink } from './ForceDirectedGraphLink.class';

export class ForceDirectedGraphConfiguration extends ChartConfiguration {
  readonly type: string = 'forceDirectedGraph';

  margin: ChartMarginConfiguration;

  linkStrength: number = 0.1;
  friction: number = 0.9;
  linkDist: number = 30;
  charge: number = -120;
  gravity: number = 0.1;
  theta: number = 0.8;
  alpha: number = 0.1;
  radius: number = 5;

  nodes: Array<ForceDirectedGraphNode>;
  links: Array<ForceDirectedGraphLink>;


  constructor() {
    super();
    this.margin = new ChartMarginConfiguration();
  }

  get _nodes() {
    return this.nodes;
  }

  get _links() {
    return this.links;
  }
}
